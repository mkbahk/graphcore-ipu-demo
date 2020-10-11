# Graphcore Poplar Library Enable by Moon-Kee Bahk
export TF_POPLAR_FLAGS=--executable_cache_path=/home/$USER/tmp/
export TMPDIR=/home/$USER/tmp/
#source /home/$USER/poplar_sdk-ubuntu_18_04-1.3.0+272-e24ae395db/gc_kernel-module-ubuntu_18_04-1.0.45+3775-58265f3c37/pkg/driver_load.sh
source /home/$USER/poplar_sdk-ubuntu_18_04-1.3.0+272-e24ae395db/poplar-ubuntu_18_04-1.3.36+42067-d79747d7ca/enable.sh
source /home/$USER/poplar_sdk-ubuntu_18_04-1.3.0+272-e24ae395db/popart-ubuntu_18_04-1.3.35+1943-3fa17782be/enable.sh
