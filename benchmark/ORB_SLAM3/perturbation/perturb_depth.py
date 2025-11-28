import os
import argparse
import numpy as np
import cv2

import rospy
from sensor_msgs.msg import Image
from cv_bridge import CvBridge

import utils_and_methods as utils
from PIL import Image as PILImage

def perturb_and_publish_to_topic_rgbd(dir_image: str, dir_depth: str, stamp_file: str, perturb: callable, lv: int, topic_image: str, topic_depth: str):
    print("Processing input files...")
    images = utils.load_images_from_folder(dir_image)
    depths = utils.load_depth_from_folder(dir_depth)
    stamps = utils.load_timestamps_from_file(stamp_file)
    if len(images) < len(stamps): 
        print("Number of timestamps (%i) does not match number of images (%i). " % (len(stamps), len(images)))
        return 
    
    rospy.init_node("perturbed")
    img_pub = rospy.Publisher(topic_image, Image, queue_size=20)
    dep_pub = rospy.Publisher(topic_depth, Image, queue_size=20)

    bridge = CvBridge()
    rate = rospy.Rate(20) # NEEDS TO DEFINE
    rng = np.random.default_rng()
    for i in range(len(images)):
        # From time in seconds (float) to the ROS Time class, 
        # which consists of two integers: seconds since epoch and nanoseconds since seconds
        t = rospy.rostime.Time.from_sec(stamps[i])
        
        # Image
        msg = bridge.cv2_to_imgmsg(images[i], encoding="passthrough")
        msg.header.seq = i
        msg.header.stamp = t

        img_pub.publish(msg)

        # Depth
        img_depth = depths[i]
        img_depth = perturb(img_depth, lv).astype(np.uint16)

        msg_depth = bridge.cv2_to_imgmsg(img_depth, encoding="16UC1")
        msg_depth.header.seq = i
        msg_depth.header.stamp = t
        dep_pub.publish(msg_depth)

        if (i % 200 == 0):    
            print("Published %i / %i" % (i, len(images)))

        rate.sleep()

if __name__ == '__main__':
    parser = argparse.ArgumentParser(description="Read frames form file, apply perturbations, then publish to rostopic")
    parser.add_argument("folder_path",      help = "Input folder containing images.")     
    parser.add_argument("timestamp_file",   help = "File containing corresponding timestamps [sec].")
    parser.add_argument("--depth_path",      help = "Input folder containing depths.", nargs = '?', default = "")
    parser.add_argument("--image_topic", help = "Image topic.",             nargs = '?', default = "/camera/image_raw")   # topic to be published
    parser.add_argument("--depth_topic", help = "Depth topic.",             nargs = '?', default = '/camera/depth_registered/image_raw') # topic name to be written
    parser.add_argument("--method",      help = "method name (see script)", nargs = '?', default = "gaussian_blur")
    parser.add_argument("--severity",    help = "severity [1,5]",           nargs = '?', type = int, default = 1)

    args = parser.parse_args()
    dir = args.folder_path
    stamp_file = args.timestamp_file
    print("start_perturbation")
    d = {'depth_add_gaussian_noise': utils.depth_add_gaussian_noise, 
         'depth_add_edge_erosion': utils.depth_add_edge_erosion,
         'depth_add_random_mask': utils.depth_add_random_mask,
         'depth_add_fixed_mask': utils.depth_add_fixed_mask,
         'depth_range': utils.depth_range}
    
    if d.get(args.method) != None: 
        perturb = d[args.method]
    else:
        print("Invalid perturbation method. \n")

    print ("Images: %s \nPerturbation: %s %d \nPublish to %s" % 
           (dir, args.method, args.severity, args.image_topic))
     
    perturb_and_publish_to_topic_rgbd(dir, args.depth_path, stamp_file, perturb, args.severity, "/camera/rgb/image_raw", args.depth_topic)
