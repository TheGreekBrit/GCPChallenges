#!/bin/bash
cat /etc/passwd
apt update -y
apt install virtualenv -y
mkdir -p /root/startup
cd /root/startup
git clone https://github.com/TheGreekBrit/GCPChallenges.git
cd GCPChallenges
git checkout Challenge2
virtualenv venv
source venv/bin/activate
pip install -r requirements.txt
echo "[supervisord]

[program:flask-daemon]
command=$(pwd)/venv/bin/flask run -h 0.0.0.0 -p 80
" > supervisord.conf
supervisord -c supervisord.conf
#echo_supervisord_conf > supervisord.conf
#sed -i 's/(serverurl=http)[^\s]+/\1:\/\/0.0'


#flask run -h 0.0.0.0 -p 80


#gunicorn -b 0.0.0.0:8080 -w 1 app:app

# echo "[Unit]
# Description=Service for gunicorn and flask

# [Service]
# Restart=always
# ExecStart=cd $(pwd) && $(which gunicorn) -w 1 app:app -b 0.0.0.0:8080
# StandardOutput=$(pwd)/stdout.log
# " > /etc/systemd/system/flask-daemon.service
# systemctl daemon-reload
# systemctl enable flask-daemon.service
# systemctl start flask-daemon.service