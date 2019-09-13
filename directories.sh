#!/bin/bash
echo Welcome to bash script for encryption using GnuPG based out of IPFS
echo Do you want to install GPG?'(y/n)'
function again() {
    read ans
    if [ $ans == 'y' ] || [ $ans == 'Y' ]; then
        sudo apt-get install gnupg
    elif [ $ans == 'n' ] || [ $ans == 'N' ]; then
        echo Assuming GPG is installed...
        continue
    else
        echo wrong input
        echo Please enter a correct value
        again
    fi
}
again

function again2() {
    echo Do you want to generate keys?'(y/n)'
    read ans2
    if [ $ans2 == 'y' ] || [ $ans2 == 'Y' ]; then
        gpg --gen-key
    elif [ $ans2 == 'n' ] || [ $ans2 == 'N' ]; then
        continue
    else
        echo wrong input
        echo Please enter a correct value
        again2
    fi
}
again2

echo enter email to export public key

read email

echo exporting public key to a file named mypubkey

gpg --export --armor $email >mypubkey.asc
echo public key exported
echo What do you want to do next?
echo 1. Import public key of another user
echo 2. List Keys
echo 3. List private keys in your keyring
read opt
function F1() {
    if [ $opt == '1' ]; then
        echo enter the public key file name to be imported, with extension
        read keyname
        gpg --import $keyname
    elif [ $opt == '2' ]; then
        echo Listing keys
        gpg --list-keys
    elif [ $opt == '3' ]; then
        // variable -eq int to equate to integer
        ech#!/bin/basho Listing private keys
        gpg#!/bin/bash --list-secret-keys
    else#!/bin/bash
        echo Wrong input
        echo Please choose from the given option
    fi
}
F1
echo The GPG setup helps us create the public and private keys used for encryption
echo We’re done with GPG setup. Let’s move onto IPFS
echo IPFS or Interplanetary File System generates a hash for any file and that hash can be used to download the ecrypted file on another computer.
echo download the ipfs from this link '(PS : Choose the go-ipfs package as we have followed it in this script)'
echo 'https://dist.ipfs.io/#go-ipfs'
echo after installing, execute the following commands to add ipfs to your PATH
echo 'cd go-ipfs'
echo 'sudo ./install.sh'
echo Assuming IPFS is installed succesfully we can now move towards generating a hash by uploading the file in IPFS after encrypting a file using a public key.

 sudo /bin/bash ./ipfsc.sh  //calling another script to initialize ipfs daemons

function again3() {
    echo enter 1 to encrypt a file, 2 to decrypt
    read ans2
    if [ $ans2 == '1' ]; then
        echo encrypting file using gpg
        echo enter username
        read user
        echo enter filename
        read fname
        gpg --encrypt --recipient "$user" $fname
        echo encryption successfull, adding file to IPFS
        ipfs add $fname.gpg
        echo File added successfully, you can now send the hash to the other computer
    elif [ $ans2 == '2' ]; then
        echo enter the file hash on ipfs
        read hsh
        ipfs get $hsh
        echo enter name of the file to be created, with extension similar to the file downloaded from IPFS hash
        read fname2
        gpg --decrypt $hsh >fname2
        echo file created successfully after decryption
    else
        echo wrong input
        echo Please enter a correct value
        again2
    fi
}
again3
