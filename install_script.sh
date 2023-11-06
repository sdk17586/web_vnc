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

# VNC 서버 시작을 위한 기본 설정 파일 생성
/opt/TurboVNC/bin/vncserver -kill :1 || true  # 이전에 실행된 VNC 세션 종료 시도
mv $HOME/.vnc/xstartup $HOME/.vnc/xstartup.bak || true  # 기존의 xstartup 백업
echo "#!/bin/sh" > $HOME/.vnc/xstartup
echo "unset SESSION_MANAGER" >> $HOME/.vnc/xstartup
echo "unset DBUS_SESSION_BUS_ADDRESS" >> $HOME/.vnc/xstartup
echo "[ -x /etc/vnc/xstartup ] && exec /etc/vnc/xstartup" >> $HOME/.vnc/xstartup
echo "[ -r $HOME/.Xresources ] && xrdb $HOME/.Xresources" >> $HOME/.vnc/xstartup
echo "xsetroot -solid grey" >> $HOME/.vnc/xstartup
echo "vncconfig -iconic &" >> $HOME/.vnc/xstartup
echo "autocutsel -fork" >> $HOME/.vnc/xstartup
echo "startxfce4 &" >> $HOME/.vnc/xstartup
chmod +x $HOME/.vnc/xstartup


