echo $1
rootdirectory="$PWD"
# ---------------------------------

#dirs="hardware/interfaces system/sepolicy frameworks/base"
dirs="frameworks/base packages/services/BuiltInPrintService"

for dir in $dirs ; do
	cd $rootdirectory
	cd $dir
	echo "Reverting $dir patches..."
	git apply --reverse $rootdirectory/device/htc/htc_v36bml_dugl/patches/$dir/*.patch
	git reset --hard
	git clean -f -d
	echo " "
done

# -----------------------------------
echo "Changing to build directory..."
cd $rootdirectory
