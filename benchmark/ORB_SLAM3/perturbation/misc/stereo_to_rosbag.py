import os
import argparse
import cv2

import rosbag
from rospy import rostime
from sensor_msgs.msg import Image
from cv_bridge import CvBridge

import utils_and_methods as utils


def save_to_rosbag(dir_left: str, dir_right: str, stamp_file: str, topic_left: str, topic_right: str): 
    bridge = CvBridge()
    bag_name = dir_left[0:-1] + "_stereo.bag"

    im_left = utils.load_images_from_folder(dir_left)
    im_right = utils.load_images_from_folder(dir_right)
    stamps = utils.load_timestamps_from_file(stamp_file)
    if len(im_left) != len(stamps): 
        print("Number of timestamps (%i) does not match number of images (%i). " % (len(stamps), len(im_left)))
        return 
    if len(im_right) != len(stamps): 
        print("Number of timestamps (%i) does not match number of depths (%i). " % (len(stamps), len(im_right)))
        return 

    with rosbag.Bag(bag_name, 'w') as bag: 
        for i in range(len(im_left)):
            # From time in seconds (float) to the ROS Time class, 
            # which which consists of two integers: seconds since epoch and nanoseconds since seconds
            t = rostime.Time.from_sec(stamps[i])
            msg = bridge.cv2_to_imgmsg(im_left[i], encoding="passthrough")
            
            # Modify message header
            msg.header.seq = i
            msg.header.stamp = t

            # Write to topic in rosbag
            bag.write(topic_left, msg, t)

            # Depth
            msg_depth = bridge.cv2_to_imgmsg(im_right[i], encoding="passthrough")
            
            # Modify message header
            msg_depth.header.seq = i
            msg_depth.header.stamp = t

            # Write to topic in rosbag
            bag.write(topic_right, msg_depth, t)
            
            if (i % 500 == 0):    
                print("Wrote image %i" % i)

    bag.close()


if __name__ == '__main__':
    parser = argparse.ArgumentParser(description="Write timestamped images to a ROS bag.")
    parser.add_argument("left_path",      help = "Input folder containing images.")     
    parser.add_argument("right_path",      help = "Input folder containing depth.")     
    parser.add_argument("timestamp_file",  help = "File containing corresponding timestamps [sec].")     
    parser.add_argument("--left_topic",   help = "Left image topic.", nargs = '?', default = '/camera/left/image_raw') # topic name to be written
    parser.add_argument("--right_topic",   help = "Right image topic.", nargs = '?', default = '/camera/right/image_raw') # topic name to be written

    args = parser.parse_args()
    dir_left = args.left_path
    dir_right = args.right_path
    stamp_file = args.timestamp_file
    topic_left = args.left_topic
    topic_right = args.right_topic

    print ("Save to topic %s and %s" % (topic_left, topic_right))
    
    save_to_rosbag(dir_left, dir_right, stamp_file, topic_left, topic_right)