import os
import argparse
import numpy as np
import cv2

import rospy
from sensor_msgs.msg import Image
from cv_bridge import CvBridge

from PIL import Image as PILImage

def load_images_from_folder(dir):
    images = []
    i = 0

    for filename in sorted(os.listdir(dir)):
        if filename[-3:] == "npy": 
            img = np.load(os.path.join(dir,filename))
            # img = np.clip(img, 0, 6)
        else: 
            img = cv2.imread(os.path.join(dir,filename))
        if img is not None:
            images.append(img)
            
        if i % 200 == 0: 
            print(i)
        i += 1
    return images


def load_timestamps_from_file(stamp_file): 
    stamps = []
    with open(stamp_file) as f:
        for stamp in f:
            stamps.append(float(stamp))
    return stamps


def misalign_and_publish_to_topic_rgbd(dir_image: str, dir_depth: str, stamp_file: str, to_add: int, dynamic: int, topic_image: str, topic_depth: str):
    print("Processing input files...")
    images = load_images_from_folder(dir_image)
    depths = load_images_from_folder(dir_depth)
    stamps = load_timestamps_from_file(stamp_file)
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
        if dynamic == 1: 
            to_add = rng.integers(to_add - 1, to_add + 1, endpoint=True)
        if i + to_add >= len(images):
            continue

        # From time in seconds (float) to the ROS Time class, 
        # which consists of two integers: seconds since epoch and nanoseconds since seconds
        t = rospy.rostime.Time.from_sec(stamps[i])
        img = PILImage.fromarray(images[i])
        img = np.array(img).astype(np.uint8)
        img = cv2.cvtColor(img, cv2.COLOR_RGB2GRAY)

        # Create message and modify header
        msg = bridge.cv2_to_imgmsg(img, encoding="mono8")
        msg.header.seq = i
        msg.header.stamp = t

        # Publish to topic 
        img_pub.publish(msg)


        msg_depth = bridge.cv2_to_imgmsg(depths[i + to_add], encoding="passthrough")
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
    parser.add_argument("--depth_path",     help = "Input folder containing depths.", nargs = '?', default = "")
    parser.add_argument("--image_topic",    help = "Image topic.",             nargs = '?', default = "/camera/image_raw")   # topic to be published
    parser.add_argument("--depth_topic",    help = "Depth topic.",             nargs = '?', default = '/camera/depth_registered/image_raw') # topic name to be written
    parser.add_argument("--to_add",          help = "# misaligned frames",           nargs = '?', type = int, default = 1)
    parser.add_argument("--dynamic",          help = "dynamic # frames",           nargs = '?', type = int, default = 0)

    args = parser.parse_args()
    dir = args.folder_path
    stamp_file = args.timestamp_file

    print ("Images: %s \nRatio: %d \nPublish to %s" % 
           (dir, args.to_add, args.image_topic))
    
    misalign_and_publish_to_topic_rgbd(dir, args.depth_path, stamp_file, args.to_add, args.dynamic, "/camera/rgb/image_raw", args.depth_topic)
