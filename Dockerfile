FROM cr4igo/dwplite:latest

RUN add-apt-repository ppa:obsproject/obs-studio \
        && apt-get update \
        && apt-get install --no-install-recommends -y ffmpeg obs-studio \
	&& apt-get clean
