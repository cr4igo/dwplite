FROM ubuntu

RUN apt-get update \
    && apt-get install --no-install-recommends -y software-properties-common curl wget libxext-dev libxrender-dev libxtst-dev \
    && curl -sSL https://deb.nodesource.com/gpgkey/nodesource.gpg.key | sudo apt-key add - \
    && wget -qO- https://deb.nodesource.com/setup_12.x | sudo -E bash - \
    && curl -sL https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
	&& echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list \
	&& apt-get install --no-install-recommends -y nodejs yarn openjdk-11-jdk language-pack-de language-pack-gnome-de \
	&& locale-gen de_DE.UTF-8 \
    && update-locale LANG=de_DE.UTF-8 \
	&& apt-get clean \
	&& wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add - \
    && apt-get update && apt-get install --no-install-recommends -y software-properties-common && add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" \
    && apt-get update \
    && apt-get install --no-install-recommends -y git apt-transport-https wget code openssh-server \
	&& apt-get clean


#RUN wget -q -O WebStorm.tar.gz https://download-cf.jetbrains.com/webstorm/WebStorm-2020.2.2.tar.gz && \
#  tar xfz WebStorm.tar.gz && \
#  rm *.tar.gz && \
#  mv WebStorm* webstorm && \
#  ln -s /devtoolbox/webstorm/bin/webstorm.sh /sbin/webstorm

