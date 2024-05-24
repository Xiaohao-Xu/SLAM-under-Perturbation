import os
import cv2

cap = cv2.VideoCapture(0)

fourcc = cv2.VideoWriter_fourcc(*'mp4v')
out = cv2.VideoWriter('trajectory_rot1_trans0dot0125.mp4', fourcc, 20.0, (1200,700))

i = 0

for filename in sorted(os.listdir(os.path.curdir)):
    if filename[0:5] == "frame":
        img = cv2.imread(os.path.join(os.path.curdir, filename))
        if img is not None:
            # print('a')
            out.write(img)
        
        if i % 200 == 0: 
            print(i)
        i += 1

out.release()