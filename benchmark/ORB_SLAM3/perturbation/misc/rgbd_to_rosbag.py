import os
import argparse
import cv2

import rosbag
from rospy import rostime
from sensor_msgs.msg import Image
from cv_bridge import CvBridge


def load_images_from_folder(dir):
    images = []
    for filename in sorted(os.listdir(dir)):
        img = cv2.imread(os.path.join(dir,filename))
        if img is not None:
            images.append(img)
    return images


def load_timestamps_from_file(stamp_file): 
    stamps = []
    with open(stamp_file) as f:
        for stamp in f:
            stamps.append(float(stamp))
    return stamps


def save_to_rosbag(dir_image: str, dir_depth: str, stamp_file: str, topic_image: str, topic_depth: str): 
    bridge = CvBridge()
    bag_name = dir_image[0:-1] + "_rgbd.bag"

    images = load_images_from_folder(dir_image)
    depths = load_images_from_folder(dir_depth)
    stamps = load_timestamps_from_file(stamp_file)
    if len(images) != len(stamps): 
        print("Number of timestamps (%i) does not match number of images (%i). " % (len(stamps), len(images)))
        return 
    if len(depths) != len(stamps): 
        print("Number of timestamps (%i) does not match number of depths (%i). " % (len(stamps), len(depths)))
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
            bag.write(topic_image, msg, t)

            # Depth
            msg_depth = bridge.cv2_to_imgmsg(depths[i], encoding="passthrough")
            
            # Modify message header
            msg_depth.header.seq = i
            msg_depth.header.stamp = t

            # Write to topic in rosbag
            bag.write(topic_depth, msg_depth, t)
            
            if (i % 500 == 0):    
                print("Wrote image %i" % i)

    bag.close()


if __name__ == '__main__':
    parser = argparse.ArgumentParser(description="Write timestamped images to a ROS bag.")
    parser.add_argument("image_path",      help = "Input folder containing images.")     
    parser.add_argument("depth_path",      help = "Input folder containing depth.")     
    parser.add_argument("timestamp_file",  help = "File containing corresponding timestamps [sec].")     
    parser.add_argument("--image_topic",   help = "Image topic.", nargs = '?', default = '/camera/rgb/image_raw') # topic name to be written
    parser.add_argument("--depth_topic",   help = "Depth topic.", nargs = '?', default = '/camera/depth_registered/image_raw') # topic name to be written

    args = parser.parse_args()
    dir_image = args.image_path
    dir_depth = args.depth_path
    stamp_file = args.timestamp_file
    topic_image = args.image_topic
    topic_depth = args.depth_topic

    print ("Save to topic %s and %s" % (topic_image, topic_depth))
    
    save_to_rosbag(dir_image, dir_depth, stamp_file, topic_image, topic_depth)