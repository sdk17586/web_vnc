#!/bin/bash

XAUTHORITY_FILE="/root/.Xauthority"
if [ ! -f "$XAUTHORITY_FILE" ]; then
    touch "$XAUTHORITY_FILE"
fi

CURPATH=/root/web_vnc_view
PATH_NOVNC=$CURPATH/noVNC
NOVNC=$PATH_NOVNC/utils/novnc_proxy

if [ "$(lsof -ti:6080)" ]; then
    lsof -ti:6080 | xargs kill -9
fi

/opt/TurboVNC/bin/vncserver -kill :9
#/opt/TurboVNC/bin/vncserver :9 -wm /usr/bin/xfce4-session
/opt/TurboVNC/bin/vncserver :9 -wm /usr/bin/xfce4-session -SecurityTypes None -geometry 1280x720


if [ -f "$NOVNC" ]; then
    $NOVNC --vnc localhost:5909
else
    echo "Error: $NOVNC does not exist!"
fi

