sudo apt-get update -y && sudo apt-get install dialog bash sed wget git curl zip tar jq expect make cmake automake autoconf llvm lld lldb clang gcc binutils bison perl gperf gawk flex bc python3 zstd openssl unzip cpio bc bison build-essential ccache liblz4-tool libsdl1.2-dev libstdc++6 libxml2 libxml2-utils lzop pngcrush schedtool squashfs-tools xsltproc zlib1g-dev libncurses5-dev bzip2 git gcc g++ libssl-dev gcc-aarch64-linux-gnu gcc-arm-linux-gnueabihf gcc-arm-linux-gnueabi dos2unix kmod python2 tree -y

rm -rf .repo/local_manifests/
find . -delete
repo init -u https://github.com/crdroidandroid/android -b 10.0 --depth=1

git clone https://github.com/Frostleaft07/treble_manifest -b android-10.0 .repo/local_manifests

git clone https://github.com/phhusson/vendor_hardware_overlay -b pie vendor/hardware_overlay
git clone https://github.com/Frostleaft07/device_phh_treble -b android-10.0 device/phh/treble
git clone https://github.com/phhusson/vendor_vndk -b android-10.0 vendor/vndk
git clone https://github.com/phhusson/vendor_vndk-tests -b master vendor/vndk-tests
git clone https://github.com/phhusson/gapps-go -b master vendor/gapps-go
git clone https://github.com/phhusson/vendor_interfaces -b pie vendor/interfaces
git clone https://github.com/Frostleaft07/keys -b crQ vendor/extra
git clone https://github.com/phhusson/vendor_magisk -b android-10.0 vendor/magisk

/opt/crave/resync.sh ; repo sync -c --no-clone-bundle --no-tags --optimized-fetch --prune --force-sync -j8

ls build
tree device/phh/
source build/env*.sh

git clone --depth=1 https://github.com/eremitein/treble-patches -b crdrom dajjal

mv dajjal/* .
bash apply*.sh .
rm -rf dajjal patches

dajjal=$(pwd)

cd device/phh/*/
bash generate.sh crdroid
git restore .
cd $dajjal

rm -rf packages/apps/ManagedProvisioning
git clone --depth=1 https://android.googlesource.com/platform/packages/apps/ManagedProvisioning -b android10-release packages/apps/ManagedProvisioning

export BUILD_USERNAME=Frost
export BUILD_HOSTNAME=otsu-builder
export TZ=Asia/Jakarta

lunch treble_arm64_bvN-user
make systemimage

if grep -q "BtmBypassExtraAclSetup" out/*error*.log ; then
  rm -rf device/phh/treble/bluetooth
  make systemimage
else
  echo "g ad"
fi

cd out/target/product/phhgsi_arm64_ab/

zip -r9 crdroid2024.zip system.img


curl bashupload.com -T crdroid2024.zip

curl bashupload.com -T crdroid2024.zip

curl bashupload.com -T crdroid2024.zip

curl bashupload.com -T crdroid2024.zip

curl bashupload.com -T crdroid2024.zip

curl bashupload.com -T crdroid2024.zip

curl bashupload.com -T crdroid2024.zip

curl bashupload.com -T crdroid2024.zip

curl bashupload.com -T crdroid2024.zip

curl bashupload.com -T crdroid2024.zip
