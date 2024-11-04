sudo dpkg --add-architecture i38
sudo apt install libcurl3-gnutls:i386
apt-get -y install libstdc++6 libcurl3-gnutls wget bzip2 unzip vim nano lib32gcc-s1 lib32stdc++6 lib32ncurses-dev
mkdir hlserver
cp ../tf2_ds.txt ./hlserver
cp ./update.sh ./hlserver
cp ./tf.sh ./hlserver
cp ./sourcemod.sh ./hlserver
cp ./plugins.sh ./hlserver

wget -O steam.tar.gz http://media.steampowered.com/client/steamcmd_linux.tar.gz
tar -C ./hlserver -xvf steam.tar.gz 
rm steam.tar.gz
 
cd hlserver/
#./update.sh
#./sourcemod.sh
#./plugins.sh
cd -

mkdir -p ~/.steam/sdk32/
ln -s ~/docker-mgetf-server/local/hlserver/linux32/steamclient.so ~/.steam/sdk32/steamclient.so

for port in 27005 {27015..27020}; do for proto in udp tcp; do iptables -A INPUT -p $proto -m $proto --dport $port -m state --state NEW,ESTABLISHED -j ACCEPT; done done
iptables -A INPUT -p tcp --dport 8080 -j ACCEPT
