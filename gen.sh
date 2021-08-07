sudo umount $2
sudo losetup -D
sudo rm /dev/loop8
sudo rm /dev/loop8*
sudo rm $1
sudo mkdir $2
dd if=/dev/zero of=$1 bs=1M count=2000
(
echo g;
echo n;
echo;
echo;
echo +100M;
echo t;
echo 1;
echo n;
echo;
echo;
echo;
echo w;
echo q;
) | fdisk $1
sudo mknod -m 0660 /dev/loop8 b 7 8
sudo losetup -P /dev/loop8 $1
sudo mkfs.fat -F32 /dev/loop8p1
sudo mkfs.ext4 /dev/loop8p2
sudo mount /dev/loop8p2 $2
sudo mkdir $2/boot
sudo mkdir $2/boot/efi
sudo mount /dev/loop8p1 $2/boot/efi
