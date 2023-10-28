#!/bin/bash
rm ~/.config/monitors.xml

#PATH_NOVNC=/home/hjpark/web_vnc_view/noVNC

CURPATH=$(pwd)
PATH_NOVNC=$CURPATH/noVNC
NOVNC=$PATH_NOVNC/utils/novnc_proxy

/opt/TurboVNC/bin/vncserver :9 -geometry 1280x720
$NOVNC --vnc localhost:5909
