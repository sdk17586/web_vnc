#!/bin/bash

# novnc 설치
git clone https://github.com/novnc/noVNC.git /opt/noVNC
ln -s /opt/noVNC/vnc.html /opt/noVNC/index.html
git clone https://github.com/novnc/websockify /opt/noVNC/utils/websockify

# TurboVNC 패키지 설치
dpkg -i /root/web_vnc_view/turbovnc_3.0.3_amd64.deb

# VNC 비밀번호 설정
echo "rdv12345678!" | /opt/TurboVNC/bin/vncpasswd -f > /opt/TurboVNC/bin/passwd

# VNC 서버 시작을 위한 기본 설정 파일 생성 (필요한 경우)
/opt/TurboVNC/bin/vncserver -kill :1 || true
mv ~/.vnc/xstartup ~/.vnc/xstartup.bak || true
echo "#!/bin/sh" > ~/.vnc/xstartup
echo "unset SESSION_MANAGER" >> ~/.vnc/xstartup
echo "unset DBUS_SESSION_BUS_ADDRESS" >> ~/.vnc/xstartup
echo "[ -x /etc/vnc/xstartup ] && exec /etc/vnc/xstartup" >> ~/.vnc/xstartup
echo "[ -r $HOME/.Xresources ] && xrdb $HOME/.Xresources" >> ~/.vnc/xstartup
echo "xsetroot -solid grey" >> ~/.vnc/xstartup
echo "vncconfig -iconic &" >> ~/.vnc/xstartup
echo "autocutsel -fork" >> ~/.vnc/xstartup
echo "startxfce4 &" >> ~/.vnc/xstartup
chmod +x ~/.vnc/xstartup
