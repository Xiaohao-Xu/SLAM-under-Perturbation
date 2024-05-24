#!/bin/bash

docker run -it \
    --env="NVIDIA_VISIBLE_DEVICES=all" \
    --env="NVIDIA_DRIVER_CAPABILITIES=all" \
    --net=host \
    --privileged \
    --group-add audio \
    --group-add video \
    --ulimit memlock=-1 \
    --ulimit stack=67108864 \
    --name splatam \
    --gpus all \
    -v /mnt/workspace/users/xiaohaox/splatam_docker:/splatam_self \clear
    nkeetha/splatam:v1 \
    /bin/bash
    
