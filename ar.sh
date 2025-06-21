sudo apt-get update -y && sudo apt-get install dialog bash sed wget git curl zip tar jq expect make cmake automake autoconf llvm lld lldb clang gcc binutils bison perl gperf gawk flex bc python3 zstd openssl unzip cpio bc bison build-essential ccache liblz4-tool libsdl1.2-dev libstdc++6 libxml2 libxml2-utils lzop pngcrush schedtool squashfs-tools xsltproc zlib1g-dev libncurses5-dev bzip2 git gcc g++ libssl-dev gcc-aarch64-linux-gnu gcc-arm-linux-gnueabihf gcc-arm-linux-gnueabi dos2unix kmod -y

rm -rf .repo/local_manifests/

MNFS=https://github.com/ArrowOS-Extended/android_manifest
BR=arrow-13.1

repo init -u $MNFS -b $BR --depth=1

# Check if we're running on Crave
if [ -f /opt/crave/resync.sh ]; then
    # If it exists, run the script
    /opt/crave/resync.sh
else
    # We're running on a normal system
    repo sync -c --no-clone-bundle --no-tags --optimized-fetch --prune --force-sync -j8
fi

git clone https://github.com/Frostleaft07/android_device_realme_RMX2185 -b evoxT-nonoss device/realme/RMX2185
git clone https://github.com/Frostleaft07/android_vendor_realme_RMX2185 -b T vendor/realme/RMX2185
git clone https://github.com/Frostleaft07/android_kernel_realme_mt6765 kernel/realme/mt6765
# git clone --depth=1 https://android.googlesource.com/platform/prebuilts/vndk/v29 -b android10-mainline-resolv-release prebuilts/vndk/v29
git clone https://github.com/Frostleaft07/keys -b crQ vendor/extra

source build/env*.sh

export BUILD_USERNAME=frost
export BUILD_HOSTNAME=otsu-builder
export TZ=Asia/Jakarta

lunch arrow_RMX2185-userdebug
m bacon -j$(nproc --all)
ota_sign

cd out/target/product/RMX2185/

curl bashupload.com -T A*2185*.zip

curl bashupload.com -T A*2185*.zip
