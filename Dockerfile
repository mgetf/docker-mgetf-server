from i386/ubuntu:latest
maintainer Robin Appelman <robin@icewind.nl>

RUN apt-get -y update \
	&& apt-get update 
RUN DEBIAN_FRONTEND=noninteractive apt-get -y install libstdc++6 libcurl3-gnutls wget libncurses5 bzip2 unzip vim nano \
	&& apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ENV USER tf2

RUN useradd $USER
ENV HOME /home/$USER
RUN mkdir $HOME
RUN chown $USER:$USER $HOME

USER $USER
ENV SERVER $HOME/hlserver
RUN mkdir $SERVER
RUN wget -O - http://media.steampowered.com/client/steamcmd_linux.tar.gz | tar -C $SERVER -xvz
ADD tf2_ds.txt $SERVER/
ADD update.sh $SERVER/
ADD tf.sh $SERVER/
ADD clean.sh $SERVER/
ADD sourcemod.sh $SERVER/
ADD plugins.sh $SERVER/
RUN $SERVER/update.sh && $SERVER/clean.sh
RUN $SERVER/sourcemod.sh && $SERVER/plugins.sh

EXPOSE 27015/udp

WORKDIR /home/$USER/hlserver
ENTRYPOINT ["./tf.sh"]
CMD ["+ip", "0.0.0.0", "+sv_pure", "1", "+map", "mge_training_v8_beta4b", "+maxplayers", "24"]
