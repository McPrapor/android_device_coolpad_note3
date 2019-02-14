# HTC Desire 628 dual sim - AEX 5.x (Oreo 8.1.0)

This is device tree for building of the Android Oreo 8.1.0 AOSP/AEX ROMs.

---

# About Device

![HTC Desire 628 dual sim](https://www.htc.com/managed-assets/shared/desktop/smartphones/htc-desire-628-dual-sim/pdp/Desire-628-DS-PDP-Desktop-Buy-Now.png "HTC Desire 628 dual sim")

HTC Desire 628 dual sim(htc_v36bml_dugl)

---

### Specifications

Component Type | Details
-------:|:-------------------------
CPU     | 1.3GHz Octa-Core MT6753
GPU     | Mali-T720 (3 Cores)
Memory  | 3GB RAM
Shipped Android Version | 5.1
Storage | 32GB
Battery | 2200 mAh
Display | 5.0" 1280 x 720 px DPI 294
Rear Camera | 13MP, Int.13MP
Front Camera | 5MP, Int. 5MP

---

# Build Information

## Works
 * Micro SD support
 * Vibration
 * MTP and Mass Storage modes
 * RAM and ROM
 * Offline charging 
 * Wifi
 * Bluetooth
 * RIL(settings no imei/imeisv)
 * Operator name
 * GPS
 * Audio
 * OTG
 * Adjustable brightness
 * Hardware acceleration
 * Rotation

-------------
## Testing...
 * Audio over Bluetooth (music, calls .etc)
 * All sensors

-------------
## Broken/Bugs
 * Hotspot
 * Auto brightness
 * Camera rear/front (photographs only)
 * Doze
 * Screen Recording
 * Camera rear/front (video)
 * Video_Camera
 * Flashlight (statusbar and camera)
 * SElinux
 
-------------

# Build ROM
Use server/virtual with Ubuntu 16.04 Xenial.

Install packages:
```
apt-get update
apt-get install openjdk-8-jdk android-tools-adb bc bison build-essential curl flex g++-multilib gcc-multilib gnupg gperf imagemagick lib32ncurses5-dev lib32readline-dev lib32z1-dev libesd0-dev liblz4-tool libncurses5-dev libsdl1.2-dev libssl-dev libwxgtk3.0-dev libxml2 libxml2-utils lzop pngcrush rsync schedtool squashfs-tools xsltproc yasm zip zlib1g-dev git wget curl git
```
Install repo tool:
```
mkdir -p ~/bin
wget 'https://storage.googleapis.com/git-repo-downloads/repo' -P ~/bin
chmod +x ~/bin/repo
git config --global user.name "Your Name"
git config --global user.email "your@email.com"
```
Make android source tree directories:
```
mkdir -p ~/aex/oreo/.repo/local_manifests/
cd ~/aex/oreo
```
Put manifest with our repos:
```
cat <<EOF > .repo/local_manifests/roomservice.xml
<?xml version="1.0" encoding="UTF-8"?>
<manifest>
        <remote fetch="git://github.com/" name="gh" />
        <project path="kernel/htc/htc_v36bml_dugl" name="McPrapor/kernel_misu" remote="github" revision="master"/>
        <project path="device/htc/htc_v36bml_dugl" name="McPrapor/android_device_htc_v36bml" remote="github" revision="o-8.1.0"/>
        <project path="vendor/htc/htc_v36bml_dugl" name="McPrapor/android_vendor_htc_v36bml" remote="github" revision="o-8.1.0"/>
        <project path="hardware/htc/htc_v36bml_dugl" name="McPrapor/android_hardware_htc_v36bml" remote="github" revision="o-8.1.0"/>
</manifest>
EOF
``` 
Init source tree with AEX sources:
```
repo init -u git://github.com/AospExtended/manifest.git -b 8.1.x
```

Sync source code from repos:
```
repo sync -c -j$(nproc --all) --force-sync --no-clone-bundle --no-tags
```
Apply patches:
```
sh device/htc/htc_v36bml_dugl/patches/patch.sh
```
Export some shell functions and make lunch:
```
. build/envsetup.sh
lunch full_htc_v36bml_dugl-userdebug
```
Run build:
```
mka aex -j$(nproc --all)
```

One-line build command:
```
cd /root/aex/oreo/ ; sh device/htc/htc_v36bml_dugl/patches/unpatch.sh ; repo sync -c -j$(nproc --all) --force-sync --no-clone-bundle --no-tags ; sh device/htc/htc_v36bml_dugl/patches/patch.sh ; . build/envsetup.sh ; lunch full_htc_v36bml_dugl-userdebug ; mka aex -j$(nproc --all)
```
