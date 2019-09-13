# IPFSencryption
Script file to create and share encrypted files through IPFS and GPG.
It is a user-friendly self explanatory script file to generate and share encrypted files
This file can do the following in the given sequence:
1. Download and install GnuPG(GNU Privacy Guard, a free-software replacement for Symantec's PGP cryptographic software suite,)
2. Generate the public and private key for a user using GnuPG.
3. Export the public key of a user to a file that can be later shared.
4. Ask user for options
    1. Import public key of another user say B(to encrypt files that can be decrypted only by user B)
    2. List Keys present
    3. List private keys in your keyring
5. Instructions to download the IPFS package with installation guide.
6. Calls another script ipfsc.sh.
7. This script Opens an external 'xterm' terminal which performs the following functions
   1. initialize IPFS on the system
   2. Stop any IPFS daemon running
   3. Start a fresh IPFS Daemon
8. Again provide two options:
   1. Encrypt a file(with the public key of the user you want to share the file with)
      Generate it's hash with IPFS
      Upload it on IPFS
   2. Download a file from IPFS using it's hash
      Decrypt using the host computer's private key
      Save into a new file(name specified by input from terminal) locally.
      
    
