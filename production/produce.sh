tput setaf 2
echo "You want to create pkgbuild or local kernel (1,0) : "
tput sgr0

read selec

if [[ $selec == 0 ]]

	then
		cd ..
        make mrproper
        cp production/config .config
        make olddefconfig
        make -j4
        sudo modules_install
        sudo cp -v arch/x86_64/boot/bzImage /boot/vmlinuz-mainland
        #sudo mkinitcpio -k $version -g /boot/initramfs-linux-mainland.img
        #sudo cp System.map /boot/System.map-linux-mainland 
        #sudo cp System.map-linux-mainland /boot/System.map
        #grub-mkconfig -o /boot/grub/grub.cfg 

    else
		tput setaf 2
		echo " ###################   PKGBUILD   ###################"
		tput sgr0   
        makepkg -s 
fi


