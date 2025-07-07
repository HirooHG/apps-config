# artix installation

> my install guide \
> idk if you can understand but gl hf

## Flash disks

```sh
$ dd if=artix.iso of=/dev/<usb device> bs=4M status=progress
```

## Gparted disks

> 100 Go min

## boot artix

> keytable: fr \
> tz: Europe -> Paris \
> From Stick/HDD

## create partitions

```sh
$ fdisk /dev/<disk>
> p # partitions
> n # create partition
```

> partition of swap 4Go (last sector to +4G) \
> partition of boot 2Go \
> partition root : the rest

## format partitions

```sh
> t # disk boot
# Linux extended boot -> 142

> t # disk swap
# Linux swap -> 19

> w # write changes
$ mkfs.ext4 -T small <partition boot>
$ mkfs.btrfs <partition root>
$ mkswap <partition swap>
$ swapon <partition swap>
```

## Installation

```sh
$ mount <partition root> /mnt
$ mkdir /mnt/boot
$ mount /mnt/boot <partition boot>
```

## wifi if not ethernet

```sh
$ connmanctl enable wifi
$ connmanctl
> scan wifi
> services
> agent on
> connect wifi_<completion wifi>
```

## Kernel & system

```sh
$ basestrap /mnt base base-devel runit nvim neovim sudo linux linux-headers linux-firmware \
networkmanager-runit os-prober grub efibootmgr mtools btrfs-progs dhcpcd wpa_supplicant \
wireless_tools iw rsm seatd-runit
$ fstabgen -U /mnt >> /mnt/etc/fstab
```

## root into installation

```sh
$ artix-chroot /mnt
$ ln -sf /usr/share/zoneinfo/Europe/Paris /etc/localtime
$ hwclock --systohc
$ nvim /etc/locale.gen # decomment langs (ex: en_US)
$ locale-gen
$ ln -s /etc/runit/sv/NetworkManager/ /etc/runit/runsvdir/default/
$ echo "LANG=en_US.UTF-8" > /etc/locale.conf
$ echo "KEYMAP=fr" > /etc/vconsole.conf
$ echo "<your hostname>" > /etc/hostname
$ nvim /etc/hosts
   > 127.0.0.1     localhost
   > ::1           localhost
   > 127.0.0.1     artix
$ nvim /etc/mkinitcpio.conf
> add *btrfs* into *modules*
$ mkinitcpio -p linux
$ useradd -m <user>
$ usermod -aG wheel <user>
$ passwd <user>
$ nvim /etc/sudoers # uncomment NOPASSWD: ALL
```

## grub

```sh
$ nvim /etc/default/grub # uncomment GRUB_DISABLE_OS_PROBER=false (last line)
$ mkdir /boot/efi
$ mount <efi partition> /boot/efi
```

> if dual boot

```sh
$ mount /dev/<boot partition disk> /<random folder>
```

> finally

```sh
$ os-prober
$ grub-install --target=x86_64-efi --efi-directory=/boot/efi --bootloader-id=grub --recheck
$ grub-mkconfig -o /boot/grub/grub.cfg
```

> reboot grub

## installation local

> wpa_supplicant

```sh
$ sudo pacman -Syy
```

## arch

```sh
$ nvim /etc/pacman.conf
# decomment Color & VerbosePkgList & ParralelDownload = 4 -> more if fiber
# at the end of the file, after [world repo]
    > [universe]
    >  Server = https://universe.artixlinux.org/$arch
    >  Server = https://mirror1.artixlinux.org/universe/$arch
    >  Server = https://mirror.pascalpuffke.de/artix-universe/$arch
$ sudo pacman -Syy
$ sudo pacman -S artix-archlinux-support
$ nvim /etc/pacman.conf
    > [extra]
    > Include = /etc/pacman.d/mirrorlist-arch
    > [multilib]
    > Include = /etc/pacman.d/mirrorlist-arch
```

## AUR

```sh
$ git clone https://aur.archlinux.org/paru.git
$ nvim /etc/makepkg.conf # uncomment MAKEFLAGS '-j12'
$ makepkg -si # in paru folder
```

---

> all packages in folder packages

---
