# git clone https://github.com/wanhebin/clash-for-linux
echo "export CLASH_URL='https://netbd.org/assets/t9FdycwCpF2zHWYfVBQV.yml'
export CLASH_SECRET=''">./clash-for-linux/.env
chmod 777 ./clash-for-linux/start.sh
sudo ./clash-for-linux/start.sh
echo "if !(pgrep \"clash\") >/dev/null;then
bash $(pwd)/clash-for-linux/start.sh
fi
alias cur=\"curl --head www.google.com\"
alias cu='python -c \"import torch; print(torch.cuda.is_available())\"'
alias ca=\"conda activate\"
alias de=\"conda deactivate\"
alias off=\"proxy_off\"
alias ju=\"jupyter lab --allow-root\"
source /etc/profile.d/clash.sh
proxy_on
" >>~/.bashrc
echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCeJl/MT7VTF0JuAIpWUTHz1ASHvglz+HQkur897PuY26uMqG6ypyEo+nBvO32JXDDE5P3WuqKCxU8WY7rE4ShxSqNBka9JGHTs3ysZD2BAFeEAgBqKiqIEtfT1QF3mGNYVRl0b4YpkH7scsawHxntpxwMyZiHrr4cM9il2nxBswOAnZULJkfNoq5L2k3gFbv3iZfGk+gYz4BFOA/ygmSxv+5sgJDgA1kX9Cbn2qxXzHjsCkBK/LztSWmI7T3vRj/6GuHFIBa2Ubqo7VauOWLx2YhMji2LQtgeP/wrdXKIEVhY5jRNNgm9IT1Z1BxHj6MIyzqpnumt053nF+yjJGQkz chenyujie@bogon
">/root/.ssh/authorized_keys
conda init bash
source /etc/profile.d/clash.sh
proxy_on
pip install pandas
pip install numpy
pip install openpyxl
source ~/.bashrc
proxy_off
pip install jupyterlab
pip install matplotlib
proxy_on
sudo apt update
sudo apt install cron
(crontab -l 2>/dev/null; echo "10 0 * * * shutdown -h now") | crontab -
sudo service cron restart
