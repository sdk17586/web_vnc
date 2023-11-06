#!/bin/bash

# novnc 설치 - 이 부분은 우분투의 표준 저장소에 novnc가 없다면 필요합니다.
# apt-get을 통해 직접 설치할 수 없다면 소스에서 직접 클론하는 것이 필요합니다.
git clone https://github.com/novnc/noVNC.git /opt/noVNC
ln -s /opt/noVNC/vnc.html /opt/noVNC/index.html
git clone https://github.com/novnc/websockify /opt/noVNC/utils/websockify

# TurboVNC 패키지 설치
dpkg -i /root/web_vnc_view/turbovnc_3.0.3_amd64.deb

# VNC 비밀번호 설정
echo "rdv12345678!" | /opt/TurboVNC/bin/vncpasswd -f > /opt/TurboVNC/bin/passwd

# VNC 서버 버전 확인 (실제 사용에서는 필요하지 않을 수 있음)
/opt/TurboVNC/bin/vncserver -version
