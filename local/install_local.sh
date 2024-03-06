apt-get -y install libstdc++6 libcurl3-gnutls wget bzip2 unzip vim nano lib32gcc-s1
mkdir hlserver
cp ../tf2_ds.txt ./hlserver
cp ./update.sh ./hlserver
cp ./tf.sh ./hlserver
cp ./clean.sh ./hlserver
cp ./sourcemod.sh ./hlserver
cp ./plugins.sh ./hlserver

wget -O steam.tar.gz http://media.steampowered.com/client/steamcmd_linux.tar.gz
tar -C ./hlserver -xvf steam.tar.gz 
rm steam.tar.gz
 
#./hlserver/update.sh
#./hlserver/clean.sh
#./hlserver/sourcemod.sh
#./hlserver/plugins.sh
