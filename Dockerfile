FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive
WORKDIR /rom

RUN apt-get update && apt-get install -y \
    wget \
    curl \
    vim \
    git \
    sudo \
    dialog \
    bash \
    sed \
    wget \
    git \
    curl \
    zip \
    tar \
    jq \
    expect \
    make \
    cmake \
    automake \
    autoconf \
    llvm \
    lld \
    lldb \
    clang \
    gcc \
    binutils \
    bison \
    perl \
    gperf \
    gawk \
    flex \
    bc \
    python3 \
    zstd \
    openssl \
    unzip \
    cpio \
    bc \
    bison \
    build-essential \
    ccache \
    liblz4-tool \
    libsdl1.2-dev \
    libstdc++6 \
    libxml2 \
    libxml2-utils \
    lzop \
    pngcrush \
    schedtool \
    squashfs-tools \
    xsltproc \
    zlib1g-dev \
    libncurses5-dev \
    bzip2 \
    gcc-aarch64-linux-gnu \
    gcc-arm-linux-gnueabihf \
    gcc-arm-linux-gnueabi \
    dos2unix \
    kmod \
    python2 \
    tree \
    repo \
    && rm -rf /var/lib/apt/lists/*

RUN mkdir rom && cd rom && repo init -u https://github.com/Frostleaft07/android-exthm -b exthm-11 --depth=1 --no-repo-verify && \
    mkdir -p .repo/local_manifests && \
    repo sync -c --no-clone-bundle --no-tags --optimized-fetch --prune --force-sync -j8
    
RUN git clone https://github.com/Frostleaft07/device_realme_RMX2185 -b exthm-11 device/realme/RMX2185 && \
    git clone https://github.com/Frostleaft07/vendor_realme_RMX2185 -b N11 vendor/realme/RMX2185 && \
    git clone https://github.com/Frostleaft07/keys -b crQ vendor/extra
    
RUN source build/env*.sh && \
    export BUILD_USERNAME=frost && \
    export BUILD_HOSTNAME=otsu-builder && \
    export TZ=Asia/Jakarta && \
    lunch exthm_RMX2185-userdebug
    
RUN mka bacon

RUN cd out/target/product/RMX2185/ && \
    curl bashupload.com -T exthm*2185*.zip && \
    curl bashupload.com -T exthm*2185*.zip
    
CMD ["bash"]
