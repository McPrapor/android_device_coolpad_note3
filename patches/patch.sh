echo $1
rootdirectory="$PWD"
# ---------------------------------

dirs="sensors"

for dir in $dirs ; do
	echo "Applying $dir patches..."
	git apply device/coolpad/note3/patches/$dir/*.patch
	echo " "
done

# -----------------------------------
echo "Changing to build directory..."
cd $rootdirectory
