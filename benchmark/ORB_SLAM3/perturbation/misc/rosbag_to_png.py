import os
import argparse
import cv2

import rosbag
from sensor_msgs.msg import Image
from cv_bridge import CvBridge

def save_to_png(bag: rosbag.Bag, BAG_FILE: str, TOPIC: str):
    bridge = CvBridge()
    path = os.path.join(BAG_FILE[0:-4], TOPIC[1:])
    print(path)
    os.makedirs(path, exist_ok=True)

    count = 0
    bag.get_type_and_topic_info()
    for topic, msg, t in bag.read_messages(topics=[TOPIC]):
        # ROS image message to cv2 image (np array). 
        cv_img = bridge.imgmsg_to_cv2(msg, desired_encoding="passthrough")

        cv2.imwrite(os.path.join(path, "%05i.png" % count), cv_img)

        if (count % 500 == 0):    
            print ("Extracted %i images" % count)
        count += 1


# Extracts images in image_topic from rosbag bag_file 
# Saves in a new folder under the same path as the rosbag 
# If do not know topic name, can leave blank first, will print out the avalaible topic names
if __name__ == '__main__':
    parser = argparse.ArgumentParser(description="Extract images from a ROS bag.")
    parser.add_argument("bag_file",    help = "Input ROS bag.")     # rosbag w/. path
    parser.add_argument("image_topic", help = "Image topic.", nargs = '?', default=None)       # topic name in rosbag to be perturbed

    args = parser.parse_args()
    BAG_FILE = args.bag_file
    TOPIC = args.image_topic

    print ("Extracing topic %s from %s" % (args.image_topic, args.bag_file))
    
    bag = rosbag.Bag(args.bag_file, 'r')

    topics = bag.get_type_and_topic_info()[1].keys() #all the topics info
    print("\nAvailable topics in bag file are:{}".format(list(topics)))

    if TOPIC == None: 
        print("No topic specified. ")
    else: 
        save_to_png(bag, BAG_FILE, TOPIC)
    bag.close()