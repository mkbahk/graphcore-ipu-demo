## 아래의 내용을 .profile 에 넣어주세요.
# set Graphcore IPU Poplar SDK 2.1
export TF_POPLAR_FLAGS=--executable_cache_path=~/tmp/
export TMPDIR=~/tmp/
source ~/poplar_sdk-ubuntu_18_04-2.1.0+617-6bb5f5b742/poplar-ubuntu_18_04-2.1.0+145366-ce995e299d/enable.sh
source ~/poplar_sdk-ubuntu_18_04-2.1.0+617-6bb5f5b742/popart-ubuntu_18_04-2.1.0+145366-ce995e299d/enable.sh
