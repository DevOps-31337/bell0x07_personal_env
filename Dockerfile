FROM ubuntu:20.04
RUN apt-get update && apt-get install -y \
    apt-transport-https \
    gnupg2 \
    curl \
    apt-utils \
    lsb-release \
    software-properties-common \
    && rm -rf /var/lib/apt/lists/*
RUN curl -fsSL https://apt.releases.hashicorp.com/gpg | apt-key add -
RUN apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
RUN curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -
RUN echo "deb https://apt.kubernetes.io/ kubernetes-xenial main" | tee -a /etc/apt/sources.list.d/kubernetes.list
RUN apt-get update
RUN apt-get update && apt-get install -y terraform \
    kubectl \
    htop \
    screen \
    mc \
    zsh \
    git \
    vim \
    nano \
    net-tools \
    curl \
    dnsutils \
    ethtool \
    less \
    lsof \
    man \
    ncdu \
    nmap \
    net-tools \
    netcat-openbsd \
    pv \
    speedtest-cli \
    tcpdump \
    whois \
    unzip \
    python3-pip \
    lnav \
    zip \
    openssh-client \
    ansible \
    python3 \
    && apt-get clean all \
    && rm -rf /var/lib/apt/lists/*
ADD https://github.com/derailed/k9s/releases/download/v0.22.1/k9s_Linux_arm64.tar.gz ./binaries
