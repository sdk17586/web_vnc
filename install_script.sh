#!/bin/bash

# novnc 설치
git clone https://github.com/novnc/noVNC.git /opt/noVNC
ln -s /opt/noVNC/vnc.html /opt/noVNC/index.html
git clone https://github.com/novnc/websockify /opt/noVNC/utils/websockify

# TurboVNC 패키지 설치
dpkg -i /root/web_vnc_view/turbovnc_3.0.3_amd64.deb

# VNC 비밀번호 설정
export HOME=/root
mkdir -p $HOME/.vnc
echo "rdv1234!" | /opt/TurboVNC/bin/vncpasswd -f > $HOME/.vnc/passwd
chmod 600 $HOME/.vnc/passwd



