#!/bin/bash

sudo apt install novnc
sudo dpkg -i /root/web_vnc_view/turbovnc_3.0.3_amd64.deb
git clone https://github.com/novnc/websockify noVNC/utils/websockify

/opt/TurboVNC/bin/vncserver -version
