import os
import argparse
import numpy as np
import cv2

import rospy
import rosbag
from sensor_msgs.msg import Image
from cv_bridge import CvBridge

import utils_and_methods as utils


def perturb_and_save_to_png(bag: rosbag.Bag, perturb: callable, lv: int, BAG_FILE: str, TOPIC: str):
    bridge = CvBridge()
    count = 0
    path = os.path.join(BAG_FILE[0:-4], "%s_%i" % (args.method, lv))
    os.makedirs(path, exist_ok=True)

    for topic, msg, t in bag.read_messages(topics=[TOPIC]):
        # ROS image message to cv2 image (np array). 
        # TUM-VI uses mono (grayscale) uint8 eocnding [0,255)
        cv_img = bridge.imgmsg_to_cv2(msg, desired_encoding="mono8")
        cv_img = perturb(cv_img, lv).astype(np.uint8)

        cv2.imwrite(os.path.join(path, "%04i.png" % count), cv_img)

        if (count % 500 == 0):    
            print ("Perturbed %i images" % count)

        count += 1


def perturb_and_save_to_rosbag(bag: rosbag.Bag, perturb: callable, lv: int, BAG_FILE: str, TOPIC: str): 
    bridge = CvBridge()
    n_bag_name = BAG_FILE[0:-4] + "_" + args.method + "_" + str(lv) + ".bag"
    n_topic = TOPIC + "_pt"
    
    count = 0
    with rosbag.Bag(n_bag_name, 'w') as n_bag: 
        for topic, msg, t in bag.read_messages():
            if (topic == TOPIC):
                # convert to cv2
                # TUM_VI uses grayscale uint8 [0, 255) format
                cv_img = bridge.imgmsg_to_cv2(msg, desired_encoding="mono8")
                cv_img = perturb(cv_img, lv).astype(np.uint8)

                # convert back to msg
                # header.stamp contains timestamp information 
                n_msg = bridge.cv2_to_imgmsg(cv_img, encoding="mono8")
                n_msg.header = msg.header
                print(n_msg.header.stamp, t)
                print(type(n_msg.header), type(t))

                n_bag.write(n_topic, n_msg, t)
                if (count % 500 == 0):    
                    print ("Wrote image %i" % count)
                count += 1
            else: 
                n_bag.write(topic, msg, t)

    n_bag.close()


def perturb_and_publish_to_topic(bag: rosbag.Bag, perturb: callable, lv: int, BAG_FILE: str, TOPIC: str):
    rospy.init_node("perturbed")
    # topic_name = TOPIC + "_pt"
    topic_name = "/camera/image_raw"
    img_pub = rospy.Publisher(topic_name, Image, queue_size=20)

    bridge = CvBridge()
    rate = rospy.Rate(20) # NEEDS TO DEFINE
    count = 0
    for topic, msg, t in bag.read_messages():
        if topic == TOPIC:
            # convert to cv2
            # TUM_VI uses grayscale uint8 [0, 255) format
            cv_img = bridge.imgmsg_to_cv2(msg, desired_encoding="mono8")
            cv_img = perturb(cv_img, lv).astype(np.uint8)

            # convert back to msg
            # header.stamp contains timestamp information 
            n_msg = bridge.cv2_to_imgmsg(cv_img, encoding="mono8")
            n_msg.header = msg.header

            img_pub.publish(n_msg)
            if (count % 500 == 0):    
                print ("Published %i" % count)
            count += 1

            rate.sleep()


if __name__ == '__main__':
    parser = argparse.ArgumentParser(description="Extract images from a ROS bag.")
    parser.add_argument("bag_file",    help = "Input ROS bag.")             # rosbag w/. path
    parser.add_argument("--image_topic", help = "Image topic.",             nargs = '?', default = "/cam0/image_raw")   # topic in rosbag to be perturbed
    parser.add_argument("--publish_to",  help = "[png, bag, topic]",        nargs = '?', default = "png")               # ["png", "bag", "topic"]
    parser.add_argument("--method",      help = "method name (see script)", nargs = '?', default = "gaussian_blur")
    parser.add_argument("--severity",    help = "severity [1,5]",           nargs = '?', type = int, default = 0)

    args = parser.parse_args()
    BAG_FILE = args.bag_file
    TOPIC = args.image_topic
    d = {'gaussian_noise': utils.gaussian_noise, 
         'shot_noise': utils.shot_noise,
         'impulse_noise': utils.impulse_noise,
         'speckle_noise': utils.speckle_noise,
         'gaussian_blur': utils.gaussian_blur,
         'glass_blur': utils.glass_blur, 
         'defocus_blur': utils.defocus_blur,
         'fog': utils.fog,
         'contrast': utils.contrast,
         }
    
    if d.get(args.method) != None: 
        perturb = d[args.method]
    else:
        print("Invalid perturbation method. \n")

    print ("Apply %s %d on topic %s from %s \nPublish to %s" % 
           (args.method, args.severity, args.image_topic, args.bag_file, args.publish_to))
    
    bag = rosbag.Bag(args.bag_file, 'r')
    if args.publish_to == "png":
        perturb_and_save_to_png(bag, perturb, args.severity, BAG_FILE, TOPIC)
    elif args.publish_to == "bag": 
        perturb_and_save_to_rosbag(bag, perturb, args.severity, BAG_FILE, TOPIC)
    elif args.publish_to == "topic": 
        perturb_and_publish_to_topic(bag, perturb, args.severity, BAG_FILE, TOPIC)
    else:
        print("Invalid publishing method. \n")
    bag.close()