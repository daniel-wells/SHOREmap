FROM tklx/base:0.1.1

RUN apt-get update && apt-get install -y \
        wget \
		build-essential \
        libxm4 \
		libmrm4 \
		libuil4 \
		freeglut3-dev \
		libx11-dev \
		libxmu-dev \
		libxi-dev \
		libgl1-mesa-glx \
		libglu1-mesa \
		libglu1-mesa-dev \
		libglfw3-dev \
		libgles2-mesa-dev \
		&& apt-get -f install \
		&& rm -rf /var/lib/apt/lists/* \
		&& apt-clean --aggressive

 # install dislin
RUN mkdir -p /softwares \
    && wget ftp://ftp.gwdg.de/pub/grafik/dislin/linux/i586_64/dislin-11.0.linux.i586_64.deb -P /softwares \
    && dpkg -i softwares/dislin-11.0.linux.i586_64.deb

ENV LD_LIBRARY_PATH=/usr/local/dislin/

# install libmotif4
RUN wget http://mirrors.kernel.org/ubuntu/pool/universe/m/motif/libmotif4_2.3.4-5_amd64.deb -P /softwares \
	&& dpkg -i /softwares/libmotif4_2.3.4-5_amd64.deb

# install SHOREmap
RUN wget http://bioinfo.mpipz.mpg.de/shoremap/SHOREmap_v3.4.tar.gz -P softwares \
	&& tar -zxvf softwares/SHOREmap_v3.4.tar.gz --directory softwares/ \
	&& sed -i -e 's/L\/usr\/lib\//L\/usr\/lib\/x86_64-linux-gnu\//g' softwares/SHOREmap_v3.4/makefile \
	&& make -C softwares/SHOREmap_v3.4

ENV PATH $PATH:/softwares/SHOREmap_v3.4/

ENTRYPOINT ["SHOREmap"]