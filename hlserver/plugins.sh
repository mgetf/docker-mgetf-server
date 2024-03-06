#!/bin/bash
set -e

cd $SERVER/tf2/tf

# Accelerator crash reporter
wget -nv "https://builds.limetech.io/files/accelerator-2.5.0-git138-cd575aa-linux.zip" -O "crash.zip"
unzip -o crash.zip
rm crash.zip

# This is probably a stupid way to do this but add a thing to a file
sed "159i \"MinidumpAccount\" \"76561198098770013\"" $SERVER/tf2/tf/addons/sourcemod/configs/core.cfg

# srctvplus
cd $SERVER/tf2/tf/addons

wget -nv https://github.com/dalegaard/srctvplus/releases/download/v3.0/srctvplus.vdf
wget -nv https://github.com/dalegaard/srctvplus/releases/download/v3.0/srctvplus.so

cd $SERVER/tf2/tf/addons/sourcemod/plugins

## SetTeam
wget -nv https://github.com/spiretf/setteam/raw/master/plugin/setteam.smx

cd $SERVER/tf2/tf

# SM-RipExt-Websocket
wget -nv "https://github.com/eldoradoel/sm-ripext-websocket/releases/download/2.4.0/sm-ripext--ubuntu-20.04.zip" -O "ripext.zip"
unzip -o ripext.zip
rm ripext.zip

wget -nv "https://github.com/mgetf/mgeme_sm/archive/master.zip"
unzip -o master.zip
rm mgeme_sm-master/README.md
rm mgeme_sm-master/LICENSE
cp mgeme_sm-master/* . -r
rm master.zip

cd $SERVER/tf2/tf/addons/sourcemod/plugins
chmod 0664 *.smx
