import os
import argparse
import cv2

import rosbag
from rospy import rostime
from sensor_msgs.msg import Image
from cv_bridge import CvBridge

import utils_and_methods as utils

def save_to_rosbag(dir: str, stamp_file: str, topic: str): 
    bridge = CvBridge()
    bag_name = dir[0:-1] + ".bag"

    images = utils.load_images_from_folder(dir)
    stamps = utils.load_timestamps_from_file(stamp_file)
    if len(images) != len(stamps): 
        print("Number of timestamps (%i) does not match number of images (%i). " % (len(stamps), len(images)))
        return 

    with rosbag.Bag(bag_name, 'w') as bag: 
        for i in range(len(images)):
            # From time in seconds (float) to the ROS Time class, 
            # which which consists of two integers: seconds since epoch and nanoseconds since seconds
            t = rostime.Time.from_sec(stamps[i])
            msg = bridge.cv2_to_imgmsg(images[i], encoding="passthrough")
            
            # Modify message header
            msg.header.seq = i
            msg.header.stamp = t

            # Write to topic in rosbag
            bag.write(topic, msg, t)

            if (i % 500 == 0):    
                print("Wrote image %i" % i)

    bag.close()


if __name__ == '__main__':
    parser = argparse.ArgumentParser(description="Write timestamped images to a ROS bag.")
    parser.add_argument("folder_path",      help = "Input folder containing images.")     
    parser.add_argument("timestamp_file",   help = "File containing corresponding timestamps [sec].")     
    parser.add_argument("image_topic",      help = "Image topic.") # topic name to be written

    args = parser.parse_args()
    dir = args.folder_path
    stamp_file = args.timestamp_file
    topic = args.image_topic

    print ("Save to topic %s" % (topic))
    
    save_to_rosbag(dir, stamp_file, topic)