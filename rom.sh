sudo apt-get update -y && sudo apt-get install dialog bash sed wget git curl zip tar jq expect make cmake automake autoconf llvm lld lldb clang gcc binutils bison perl gperf gawk flex bc python3 zstd openssl unzip cpio bc bison build-essential ccache liblz4-tool libsdl1.2-dev libstdc++6 libxml2 libxml2-utils lzop pngcrush schedtool squashfs-tools xsltproc zlib1g-dev libncurses5-dev bzip2 git gcc g++ libssl-dev gcc-aarch64-linux-gnu gcc-arm-linux-gnueabihf gcc-arm-linux-gnueabi dos2unix kmod -y

rm -rf .repo/local_manifests/
find . -delete

repo init -u https://github.com/TenX-OS/manifest -b eleven --depth=1

/opt/crave/resync.sh ; repo sync -c --no-clone-bundle --no-tags --optimized-fetch --prune --force-sync -j8

git clone https://github.com/Frostleaft07/device_realme_RMX2185 -b exthm-11 device/realme/RMX2185
git clone https://github.com/Frostleaft07/vendor_realme_RMX2185 -b N11 vendor/realme/RMX2185
git clone https://github.com/Frostleaft07/android_kernel_realme_mt6765 kernel/realme/mt6765
# git clone --depth=1 https://android.googlesource.com/platform/prebuilts/vndk/v29 -b android10-mainline-resolv-release prebuilts/vndk/v29
git clone https://github.com/Frostleaft07/keys -b crQ vendor/extra

ls build
source build/env*.sh

rm -rf packages/apps/ManagedProvisioning
git clone --depth=1 https://android.googlesource.com/platform/packages/apps/ManagedProvisioning -b android11-release packages/apps/ManagedProvisioning
rm -rf packages/providers/DownloadProvider/
git clone https://android.googlesource.com/platform/packages/providers/DownloadProvider -b android11-release packages/providers/DownloadProvider
rm -rf packages/apps/Settings
git clone https://github.com/Frostleaft07/packages_apps_Settings -b eleven packages/apps/Settings

otsu=$(pwd)
depis=device/realme/RMX2185

export BUILD_USERNAME=frost
export BUILD_HOSTNAME=otsu-builder
export TZ=Asia/Jakarta

lunch lineage_RMX2185-userdebug
make bacon

cd out/target/product/RMX2185/

curl bashupload.com -T Ten*2185*.zip

curl bashupload.com -T Ten*2185*.zip
