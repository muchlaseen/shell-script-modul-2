#!/bin/sh

# Program Tugas Tambahan Asisten Lab Sistem Operasi
# 06.2018.06941
# Achmad Muchlasin


clear

while :
do
	# Main Menu
	echo "        Menu"
	echo "====================="
	echo "1. Buat"
	echo "2. Hapus"
	echo "3. Rename"
	echo "4. Ganti Kepemilikan"
	echo "5. Kelola Hak Akses"
	echo "6. Exit"

	read -p 'Pilih yang mana: ' varPilihan

	case $varPilihan in
		# Create File / Folder
		1)
			echo
			echo "1. File"
			echo "2. Folder"
			read -p 'Pilih salah satu dengan nomor: ' subMenuCreate
			if [ $subMenuCreate = 1 ] 
			then
				echo
				echo "=> Buat File"
				echo "================"
				echo 
				read -p 'Nama file yang dibuat: ' createFile
				touch $createFile
				echo "Selamat~ $createFile berhasil dicreate"
				echo
				ls -l | grep $createFile
				echo
			elif [ $subMenuCreate = 2 ] 
			then
				echo 
				echo "=> Buat Folder"
		 		echo "================="
				echo
				read -p 'Nama folder yang dibuat: ' createFolder
				mkdir $createFolder
				echo "Selamat~ $createFolder berhasil dicreate"
				echo
				ls -l | grep $createFolder
				echo
			else
				echo "Pilihan tidak ada gan!"
			fi
			echo
			;;

		# Delete File / Folder
		2)
			echo
			echo "1. File"
			echo "2. Folder"
			read -p 'Pili salah satu dengan nomor: ' subMenuHapus
			if [ $subMenuHapus = 1 ]
			then
				echo "=> Hapus File"
				echo "================"
				echo
				read -p 'Nama file yang ingin dihapus: ' fileHapus
				rm $fileHapus
				echo "Selamat~ $fileHapus berhasil dihapus"
				echo
				ls
				echo
			elif [ $subMenuHapus = 2 ]
			then
				echo "=> Hapus Folder"
				echo "================"
				echo
				read -p 'Nama folder yang ingin dihapus: ' folderHapus
				rm -R $folderHapus
				echo "Selamat~ $folderHapus berhasil dihapus"
				echo
				ls
				echo
			else
				echo "Pilihan tidak ada!"
			fi
			echo
			;;

		# Rename File / Folder
		3)
			echo
			echo "1. File"
			echo "2. Folder"
			read -p 'Pilih salatu dengan nomor: ' subMenuRename
			if [ $subMenuRename = 1 ]
			then
				echo "=> Rename File"
				echo "================="
				echo
				read -p 'Nama file yang ingin direname: ' fileRenameLama
				read -p 'Nama file yang baru: ' fileRenameBaru
				mv $fileRenameLama $fileRenameBaru
				echo "Selamat~ $fileRenameLama berhasil direname menjadi $fileRenameBaru"
				echo
				ls -l | grep $fileRenameBaru
				echo
			elif [ $subMenuRename = 2 ]
			then
				echo "=> Rename Folder"
				echo "==================="
				echo
				read -p 'Nama folder yang ingin direname: ' folderRenameLama
				read -p 'Nama folder yang baru: ' folderRenameBaru
				mv $folderRenameLama $folderRenameBaru
				echo "Selamat~ $folderRenameLama berhasil direname menjadi $folderRenameBaru"
				echo
				ls -l | grep $folderRenameBaru
				echo
			else
				echo "Pilihan tidak ada!"
			fi
			echo
			;;

		# Change Owner of File / Folder
		4)
			echo
			echo "1. File"
			echo "2. Folder"
			read -p 'Pilih salah satu dengan nomor: ' subMenuOwner
			if [ $subMenuOwner = 1 ]
			then
				echo "=> Ganti Kepemilikan File"
				echo "==========================="
				echo
				read -p 'Nama user pengganti: ' userGantiFile
				read -p 'Nama file yang ingin dirubah ownernya: ' fileOwn
				sudo chown $userGantiFile $fileOwn
				echo "Selamat~ file $fileOwn sudah menjadi milik $userGantiFile"
				echo
				ls -l | grep $fileOwn
				echo
			elif [ $subMenuOwner = 2 ]
			then
				echo "=> Ganti Kepemilikan Folder"
				echo "============================"
				echo
				read -p 'Nama user pengganti: ' userGantiFolder
				read -p 'Nama folder yang ingin dirubah ownernya: ' folderOwn
				sudo chown $userGantiFolder $folderOwn
				echo "Selamat~ folder $folderOwn sudah menjadi milik $userGantiFolder"
				echo
				ls -l | grep $folderOwn
				echo
			else
				echo "Pilihan tidak ada!"
			fi
			echo 
			;;

		# User Previlleges / Permissions
		5)
			echo
			echo "ATTENTION!"
			echo "Ketentuan: "
			echo "Read = 4, Write = 2, Execute = 1, perhatikan Owner, Group, dan Othernya."
			echo 
			echo "Contoh: "
			echo "  7     5     5"
			echo "  ^     ^     ^"
			echo "Owner Group Other"
			echo
			echo "1. File"
			echo "2. Folder"
			read -p 'Pilih salah satu dengan nomor: ' subMenuPermission
			if [ $subMenuPermission = 1 ]
			then
				echo "=> Ganti Hak Akses File"
				echo "======================="
				echo
				read -p 'Nama file yang ingin diubah hak aksesnya: ' fileAccess
				read -p 'Beri permission untuk owner: ' ownerAccess
				read -p 'Beri permission untuk group: ' groupAccess
				read -p 'Beri permission untuk other: ' otherAccess
				sudo chmod $ownerAccess$groupAccess$otherAccess $fileAccess
				echo "Selamat~ File $fileAccess sudah anda ubah permission nya menjadi $ownerAccess$groupAccess$otherAccess"
				echo "Silahkan cek info dibawah ini: "
				ls -l | grep $fileAccess
				echo
			elif [ $subMenuPermission = 2 ]
			then
				
				read -p 'Nama folder yang ingin diubah hak aksesnya: ' folderAccess
				read -p 'Beri permission untuk owner: ' ownerFolderAccess
				read -p 'Beri permission untuk group: ' groupFolderAccess
				read -p 'Beri permission untuk other: ' otherFolderAccess
				sudo chmod $ownerFolderAccess$groupFolderAccess$otherFolderAccess $folderAccess
				echo "Selamat~ Folder $folderAccess sudah anda ubah permission nya menjadi $ownerFolderAccess$groupFolderAccess$otherFolderAccess"
				echo "Silahkan cek info dibawah ini: "
				ls -l | grep $folderAccess
				echo
			else
				echo "Pilihan tidak ada!"
			echo
			fi
			;;
		6)
			echo "Terima kasih telah menggunakan program ini..."
			exit
			;;
		*)
			echo "Pilihan tidak ditemukan! Coba lagi!"
			;;
	esac
done


