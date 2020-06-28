OLD_PATH=$PATH
PWD=$(pwd)

source ../../env.sh

echo "+ sudo mkdir -p $NFS_EXPORTED_ROOTFS_ROOT$(pwd)"
sudo mkdir -p $NFS_EXPORTED_ROOTFS_ROOT$(pwd)
echo "+ sudo chown -R $USER:$USER $NFS_EXPORTED_ROOTFS_ROOT$(pwd)"
sudo chown -R $USER:$USER $NFS_EXPORTED_ROOTFS_ROOT$(pwd)
echo "+ cp -r * $NFS_EXPORTED_ROOTFS_ROOT$(pwd)"
cp -r * $NFS_EXPORTED_ROOTFS_ROOT$(pwd)

PATH=$OLD_PATH
cd $PWD

