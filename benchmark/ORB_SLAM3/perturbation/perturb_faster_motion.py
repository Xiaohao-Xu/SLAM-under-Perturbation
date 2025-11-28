import os
import argparse
import numpy as np
import cv2

import rospy
from sensor_msgs.msg import Image
from cv_bridge import CvBridge

import utils_and_methods as utils
from PIL import Image as PILImage

def speed_up_and_publish_to_topic(dir: str, stamp_file: str, r: int, topic: str):
    print("Processing input files...")
    images = utils.load_images_from_folder(dir)
    stamps = utils.load_timestamps_from_file(stamp_file)
    if len(images) < len(stamps): 
        print("Number of timestamps (%i) does not match number of images (%i). " % (len(stamps), len(images)))
        return 
    
    rospy.init_node("perturbed")
    img_pub = rospy.Publisher(topic, Image, queue_size=20)

    bridge = CvBridge()
    rate = rospy.Rate(20) # NEEDS TO DEFINE

    k = 0
    for i in range(len(images)):
        if i % r != 0: 
            continue

        # From time in seconds (float) to the ROS Time class, 
        # which consists of two integers: seconds since epoch and nanoseconds since seconds
        # Use corresponding stamp to compare to ground truth
        t = rospy.rostime.Time.from_sec(stamps[i])
        img = PILImage.fromarray(images[i])
        img = np.array(img).astype(np.uint8)
        img = cv2.cvtColor(img, cv2.COLOR_RGB2GRAY)
            
        # Create message and modify header
        msg = bridge.cv2_to_imgmsg(img, encoding="mono8")
        # msg = bridge.cv2_to_imgmsg(images[i], encoding="passthrough")
        msg.header.seq = k
        msg.header.stamp = t

        # Publish to topic 
        img_pub.publish(msg)
        if (i % 200 == 0):    
            print("Published %i / %i" % (i, len(images)))

        rate.sleep()
        k += 1

def speed_up_and_publish_to_topic_rgbd(dir_image: str, dir_depth: str, stamp_file: str, r: int, topic_image: str, topic_depth: str):
    print("Processing input files...")
    images = utils.load_images_from_folder(dir_image)
    depths = utils.load_images_from_folder(dir_depth)
    stamps = utils.load_timestamps_from_file(stamp_file)
    if len(images) < len(stamps): 
        print("Number of timestamps (%i) does not match number of images (%i). " % (len(stamps), len(images)))
        return 
    
    rospy.init_node("perturbed")
    img_pub = rospy.Publisher(topic_image, Image, queue_size=20)
    dep_pub = rospy.Publisher(topic_depth, Image, queue_size=20)

    bridge = CvBridge()
    rate = rospy.Rate(20) # NEEDS TO DEFINE
    
    k = 0
    for i in range(len(images)):
        if i % r != 0:
            continue

        # From time in seconds (float) to the ROS Time class, 
        # which consists of two integers: seconds since epoch and nanoseconds since seconds
        t = rospy.rostime.Time.from_sec(stamps[i])
        img = PILImage.fromarray(images[i])
        img = np.array(img).astype(np.uint8)
        img = cv2.cvtColor(img, cv2.COLOR_RGB2GRAY)

        # Create message and modify header
        msg = bridge.cv2_to_imgmsg(img, encoding="mono8")
        msg.header.seq = k
        msg.header.stamp = t

        # Publish to topic 
        img_pub.publish(msg)

        msg_depth = bridge.cv2_to_imgmsg(depths[i], encoding="passthrough")
        msg_depth.header.seq = k
        msg_depth.header.stamp = t
        dep_pub.publish(msg_depth)

        if (i % 200 == 0):    
            print("Published %i / %i" % (i, len(images)))

        rate.sleep()
        k += 1


if __name__ == '__main__':
    parser = argparse.ArgumentParser(description="Read frames form file, apply perturbations, then publish to rostopic")
    parser.add_argument("folder_path",      help = "Input folder containing images.")     
    parser.add_argument("timestamp_file",   help = "File containing corresponding timestamps [sec].")
    parser.add_argument("--depth_path",     help = "Input folder containing depths.", nargs = '?', default = "")
    parser.add_argument("--image_topic",    help = "Image topic.",             nargs = '?', default = "/camera/image_raw")   # topic to be published
    parser.add_argument("--depth_topic",    help = "Depth topic.",             nargs = '?', default = '/camera/depth_registered/image_raw') # topic name to be written
    parser.add_argument("--ratio",          help = "Speed-up ratio",           nargs = '?', type = int, default = 1)

    args = parser.parse_args()
    dir = args.folder_path
    stamp_file = args.timestamp_file

    print ("Images: %s \nRatio: %d \nPublish to %s" % 
           (dir, args.ratio, args.image_topic))
    
    if args.depth_path == "":
        speed_up_and_publish_to_topic(dir, stamp_file, args.ratio, args.image_topic)
    else: 
        speed_up_and_publish_to_topic_rgbd(dir, args.depth_path, stamp_file, args.ratio, "/camera/rgb/image_raw", args.depth_topic)
