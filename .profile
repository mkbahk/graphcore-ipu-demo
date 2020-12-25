# 아래의 내용을 .profile 에 넣어주세요.

// SDK 1.2 버젼 예
export TF_POPLAR_FLAGS = "--executable_cache_path=/home/$USER/tmp/"
export TMPDIR=/home/$USER/tmp/
#source /home/$USER/poplar_sdk-ubuntu_18_04-1.2.0+131-495c1aa368/gc_drivers-ubuntu_18_04-1.0.44+1604-325648412e/enable.sh
source /home/$USER/poplar_sdk-ubuntu_18_04-1.2.0+131-495c1aa368/popart-ubuntu_18_04-1.2.100-63af2bbaea/enable.sh
source /home/$USER/poplar_sdk-ubuntu_18_04-1.2.0+131-495c1aa368/poplar-ubuntu_18_04-1.2.100+9677-c27b85b309/enable.sh

// SDK 1.3 버젼 예
export TF_POPLAR_FLAGS = "--executable_cache_path=/home/$USER/tmp/"
export TMPDIR=/home/$USER/tmp/
#source /home/$USER/poplar_sdk-ubuntu_18_04-1.3.0+272-e24ae395db/gc_kernel-module-ubuntu_18_04-1.0.45+3775-58265f3c37/pkg/driver_load.sh
source /home/$USER/poplar_sdk-ubuntu_18_04-1.3.0+272-e24ae395db/poplar-ubuntu_18_04-1.3.36+42067-d79747d7ca/enable.sh
source /home/$USER/poplar_sdk-ubuntu_18_04-1.3.0+272-e24ae395db/popart-ubuntu_18_04-1.3.35+1943-3fa17782be/enable.sh

// SDK 1.4 버젼 예
export TF_POPLAR_FLAGS = "--executable_cache_path=/home/$USER/tmp/"
export TMPDIR=/home/$USER/tmp/
#source /home/$USER/poplar_sdk-ubuntu_18_04-1.4.0+365-665f971c8f/gc_kernel-module-ubuntu_18_04-1.0.47+10706-b9b63c1e81pkg/driver_load.sh
source /home/$USER/poplar_sdk-ubuntu_18_04-1.4.0+365-665f971c8f/poplar-ubuntu_18_04-1.4.0+71819-c5c0c8ebab/enable.sh
source /home/$USER/poplar_sdk-ubuntu_18_04-1.4.0+365-665f971c8f/popart-ubuntu_18_04-1.4.0+5352-e86081acc9/enable.sh
