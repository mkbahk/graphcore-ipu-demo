# 아래의 내용을 .profile 에 넣어주세요.
# set Graphcore IPU SDK 2.0
export TF_POPLAR_FLAGS=--executable_cache_path=~/$USER/tmp/
export TMPDIR=~/$USER/tmp/
#source ~/$USER/poplar_sdk-ubuntu_18_04-2.0.0+481-79b41f85d1/gc_kernel-module-ubuntu_18_04-1.0.50+18673-b76151275c/pkg/driver_load.sh
source ~/$USER/poplar_sdk-ubuntu_18_04-2.0.0+481-79b41f85d1/popart-ubuntu_18_04-2.0.0+108156-165bbd8a64/enable.sh
source ~/$USER/poplar_sdk-ubuntu_18_04-2.0.0+481-79b41f85d1/poplar-ubuntu_18_04-2.0.0+108156-165bbd8a64/enable.sh


