# conda未安装时取消注释
# wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
# chmod 777 Miniconda3-latest-Linux-x86_64.sh
# ./Miniconda3-latest-Linux-x86_64.sh -b
# conda init
# conda activate base
conda create -n torch python=3.8 -y
conda activate torch
if ! (grep "alias ca=\"conda activate\"" ~/.bashrc) >/dev/null;then
echo "alias ca=\"conda activate\"" >>~/.bashrc
fi
proxy_off
conda install pytorch torchvision torchaudio pytorch-cuda=11.8 -c pytorch -c nvidia -y 
