DataSet-NetworkName-language-{fequential, functional, subclassing}.{cpu,cpu-dist,gpu-dist,tpu-dist,ipu-dist}.Technology.py

# graphcore-ipu-demo
영국 Graphcore 한국내 총판인 메가존클라우드(주) AI System Group에서 운영하는 깃트입니다.
질문은 m k b a h k @ m e g a z o n e.c o m 으로 주세요.

# 8440  서버에 접속
ssh user_id@106.246.237.171

//------------------------------------------
# Graphcore IPU Driver, Poplar Lib, PopArt Framework 설치
//------------------------------------------

#필요한 파일들은 /mnt/data 디렉토리에 있습니다.
// /mnt/data에 있는 사용할 sdk버젼을 자신의 로컬 홈에 복사하세요
tar xvf poplar_sdk-ubuntu_18_04-버젼.tar.gz
cd poplar_sdk-ubuntu_18_04-버젼

// .profile내에 아래의 문장을 삽입하거나 개별적으로 수행
# SDK 1.2 버젼 예
export TF_POPLAR_FLAGS=--executable_cache_path=/home/$USER/tmp/
export TMPDIR=/home/$USER/tmp/
#source /home/$USER/poplar_sdk-ubuntu_18_04-1.2.0+131-495c1aa368/gc_drivers-ubuntu_18_04-1.0.44+1604-325648412e/enable.sh
source /home/$USER/poplar_sdk-ubuntu_18_04-1.2.0+131-495c1aa368/popart-ubuntu_18_04-1.2.100-63af2bbaea/enable.sh
source /home/$USER/poplar_sdk-ubuntu_18_04-1.2.0+131-495c1aa368/poplar-ubuntu_18_04-1.2.100+9677-c27b85b309/enable.sh

# SDK 1.3 버젼 예
export TF_POPLAR_FLAGS=--executable_cache_path=/home/$USER/tmp/
export TMPDIR=/home/$USER/tmp/
#source /home/$USER/poplar_sdk-ubuntu_18_04-1.3.0+272-e24ae395db/gc_kernel-module-ubuntu_18_04-1.0.45+3775-58265f3c37/pkg/driver_load.sh
source /home/$USER/poplar_sdk-ubuntu_18_04-1.3.0+272-e24ae395db/poplar-ubuntu_18_04-1.3.36+42067-d79747d7ca/enable.sh
source /home/$USER/poplar_sdk-ubuntu_18_04-1.3.0+272-e24ae395db/popart-ubuntu_18_04-1.3.35+1943-3fa17782be/enable.sh

# driver 정상설치 확인명령
modinfo ipu-driver

# poplar 정상설치 확인명령
popc --version

# popart 정상설치 확인명령
python3
import popart
print(popart.__version__)

# IPU Driver, SDK가 정상적으로 올라갔는지 확인하는 명령, 시스템에 설치된 IPU에 대한 정보표시
gc-monitor

#실-시간으로 어느 사용자가 IPU 자원을 사용하고 있는 것을 지속적으로 확인하고 싶으시면 
watch -n 1 gc-monitor

//------------------------------------------
# python 가상환경을 만들어서 사용하세요.
//------------------------------------------
python3 -m venv ./venv_poplar1.3
source ./venv_poplar1.3/bin/activate

//------------------------------------------
# tensorflow 2.1버젼을 설치해 주세요.
//------------------------------------------
pip3 install wheel
pip3 install gc_tensorflow-2.1.0+1.3.30___intel_skylake512____-linux_x86_64.whl

# tensorflow 정상동작 확인 
python3
import tensorflow as tf
print(tf.__version__)

# git에서 Graphcore IPU 정상동작 확인할 수 있는 Sample 모델을 다운받으세요.
git clone https://github.com/mkbahk/graphcore-ipu-demo
git clone https://github.com/graphcore/examples.git graphcore_github_examples

# 코드실행 예)
python3 mnist-ipu-dest.py

# 모델 실행 시 IPU사용을 확인하기 위해
watch -n 1 gc-monitor --no-card-info


//------------------------------------------
# jupyter Notebook 을 사용하실 분들은 
//------------------------------------------
pip3 install jupyter

// jupyter Notebook실행 후 새로 python3 문서만들겠다고 했을 때 "500 Internal Server Error" 대응법
pip3 install --upgrade "ipython[all]"
pip3 install nbconvert==5.4.1

//xxxx는 포트번호입니다.1024 이상 번호를 사용하세요.
jupyter notebook --ip=0.0.0.0 --port=xxxx --allow-root & 
예) jupyter notebook --ip=0.0.0.0 --port=8899 --allow-root & 

//------------------------------------------
# gc-profile 사용할 경우 옵션으로 설치가능
//------------------------------------------
pip3 install gc-profile-0.8.5-py3-none-any.whl
gc-profile -d ./profile/ -- python3 xxx.py


//-------------------------------------------------------
# 가상환경과 SDK소프트웨어도 설치하기 싫으면 바로 Docker 사용가능, 이미 관리자가 Docker Image를 설치해 두었습니다. docker를 수행하기 전에 이미 운영체체 수준에서 ipu-driver만은 설치되어있어야 합니다.
//------------------------------------------

docker images

//없으면,
docker load -i poplar-docker-images-1.0.136.tar.gz

//일반 docker run으로 기동하면 gc-monitor시 ipu가 보이지 않습니다. Ctrl+Pq로 exit()하지 않고 잠시 linux shell로
gc-docker -- -ti graphcore/tensorflow:2-intel-1.3.0-bionic-20200903 /bin/bash
gc-docker -- --rm -ti graphcore/tensorflow:2-intel-1.3.0-bionic-20200903 /bin/bash

# 주의사항....주의사항....주의사항....주의사항....주의사항....
//docker 내부에 들어가면 처음 반드시 "apt update -y"해야 git 설치가 가능합니다.
apt udpate -y
apt install curl wget git -y
git clone https://github.com/graphcore/examples.git graphcore_github_examples
git clone https://github.com/mkbahk/graphcore-ipu-demo

gc-docker --device-id 4 -- --rm -ti graphcore/tools gc-inventory

gc-docker --echo --device-id 4 -- --rm -ti graphcore/tools gc-inventory
docker run --device=/dev/ipu4:/dev/ipu4 --device=/dev/ipu4_ex:/dev/ipu4_ex -ti graphcore/tools gc-inventory

gc-docker -- -ti -v /home/me/cat_pics:/cats graphcore/tensorflow ls -a /catsanddog.jpg
gc-docker -- -ti -e POPLAR_LOG_LEVEL=TRACE graphcore/tensorflow:2 python3


//------------------------------------------
# 관리자가 docker 설치 및 일반사용자가 접근가능하도록 퍼미션 허가
//------------------------------------------
sudo apt install docker.io -y

$ sudo groupadd docker
Add your user to the docker group.

$ sudo usermod -aG docker $USER
Log out and log back in so that your group membership is re-evaluated.

$ newgrp docker
Verify that you can run docker commands without sudo.

$ docker run hello-world

또는

sudo chmod 666 /var/run/docker.sock 
