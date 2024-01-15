![ZDEEX cli build - Ubuntu 18.04](https://github.com/ZDEEX-COIN/zdeex/workflows/ZDEEX%20cli%20build%20-%20Ubuntu%2018.04/badge.svg)\
![ZDEEX cli build - Ubuntu 20.04](https://github.com/ZDEEX-COIN/zdeex/workflows/ZDEEX%20cli%20build%20-%20Ubuntu%2020.04/badge.svg)\
![ZDEEX cli build - Windows cross compile 18.04](https://github.com/ZDEEX-COIN/zdeex/workflows/ZDEEX%20cli%20build%20-%20Windows%20cross%20compile%2018.04/badge.svg)\
![ZDEEX cli build - Windows cross compile 20.04](https://github.com/ZDEEX-COIN/zdeex/workflows/ZDEEX%20cli%20build%20-%20Windows%20cross%20compile%2020.04/badge.svg)\
![ZDEEX cli build - MacOS 10.15 Catalina](https://github.com/ZDEEX-COIN/zdeex/workflows/ZDEEX%20cli%20build%20-%20MacOS/badge.svg)\
![ZDEEX Logo](https://i.ibb.co/F7Dgnxy/ZDEEX-Logo-Wordmark-Gold.png "ZDEEX Chain Logo")


## ZDEEX Chain

This is the official ZDEEX Chain sourcecode repository based on https://github.com/jl777/komodo.

## Development Resources

- ZDEEX Chain Website: [https://zdeex.black](https://zdeex.black/)
- Komodo Platform: [https://komodoplatform.com](https://komodoplatform.com/)
- ZDEEX Blockexplorer: [https://explorer.zdeex.black](https://zdeex.black/)
- ZDEEX Discord: [https://zdeex.black/discord](https://zdeex.black/discord)
- BTT ANN: [https://bitcointalk.org/index.php?topic=4979549.0](https://bitcointalk.org/index.php?topic=4979549.0/)
- Mail: [marketing@zdeex.black](mailto:marketing@zdeex.black)
- Support: [https://zdeex.black/discord](https://zdeex.black/discord)
- API references & Dev Documentation: [https://docs.zdeex.black](https://docs.zdeex.black/)
- Blog: [https://zdeex.black/blog](https://zdeex.black/blog/)
- Whitepaper: [ZDEEX Chain Whitepaper](https://zdeex.black/whitepaper)

## Komodo Platform Technologies Integrated In ZDEEX Chain

- Delayed Proof of Work (dPoW) - Additional security layer and Komodos own consensus algorithm  
- zk-SNARKs - Komodo Platform's privacy technology for shielded transactions  


## Tech Specification
- Max Supply: 200 million ZDEEX
- Block Time: 60s
- Block Reward: 256 ZDEEX
- Mining Algorithm: Equihash 200,9

## About this Project
ZDEEX Chain (ZDEEX) is a 100% private send cryptocurrency. It uses a privacy protocol that cannot be compromised by other users activity on the network. Most privacy coins are riddled with holes created by optional privacy. ZDEEX Chain uses zk-SNARKs to shield 100% of the peer to peer transactions on the blockchain making for highly anonymous and private transactions.

## Getting started
Build the code as described below. To see instructions on how to construct and send an offline transaction look
at README_offline_transaction_signing.md

A list of outstanding improvements is included in README_todo.md

### Dependencies Ubuntu

```shell
#The following packages are needed:
sudo apt-get update && sudo apt-get upgrade -y
sudo apt-get install build-essential pkg-config libc6-dev m4 g++-multilib autoconf libtool libncurses-dev unzip git python zlib1g-dev wget bsdmainutils automake libboost-all-dev libssl-dev libprotobuf-dev protobuf-compiler libqrencode-dev libdb++-dev ntp ntpdate nano software-properties-common curl libevent-dev libcurl4-gnutls-dev cmake clang libsodium-dev -y


### Dependencies (Ubuntu 20.04)
```shell
#The following packages are needed:
sudo apt-get install build-essential pkg-config libc6-dev m4 g++-multilib autoconf libtool ncurses-dev unzip git python3 python3-zmq zlib1g-dev wget libcurl4-gnutls-dev bsdmainutils automake curl libsodium-dev

```shell
#On newer Linux distributions, like Ubuntu 22.04, the following additional packages are required:
sudo apt-get install liblz4-dev libbrotli-dev
```

### Dependencies Manjaro
```shell
#The following packages are needed:
pacman -Syu base-devel pkg-config glibc m4 gcc autoconf libtool ncurses unzip git python python-pyzmq zlib wget libcurl-gnutls automake curl cmake mingw-w64
```
### Build ZDEEX

This software is based on zcash and considered experimental and is continuously undergoing heavy development.

The dev branch is considered the bleeding edge codebase while the master-branch is considered tested (unit tests, runtime tests, functionality). At no point of time do the ZDEEX developers take any responsibility for any damage out of the usage of this software.
ZDEEX builds for all operating systems out of the same codebase. Follow the OS specific instructions from below.

#### Linux
```shell
git clone https://github.com/ZDEEX-COIN/zdeex --branch master
cd zdeex
# This step is not required for when using the Qt GUI
./zcutil/fetch-params.sh

# -j8 = using 8 threads for the compilation - replace 8 with number of threads you want to use; -j$(nproc) for all threads available

#For CLI binaries
./zcutil/build.sh -j8

#For qt GUI binaries
./zcutil/build-qt-linux.sh -j8.

#If you get this compile error:
qt/moc_addressbookpage.cpp:142:1: error: ‘QT_INIT_METAOBJECT’ does not name a type
  142 | QT_INIT_METAOBJECT const QMetaObject AddressBookPage::staticMetaObject = { {
      | ^~~~~~~~~~~~~~~~~~
  146 | QT_INIT_METAOBJECT const QMetaObject ZAddressBookPage::staticMetaObject = { {
      | ^~~~~~~~~~~~~~~~~~

Qt is incompatible with the libgl library.
Remove library: sudo apt-get remove libgl-dev
Install libraries: sudo apt-get install mesa-common-dev libglu1-mesa-dev
```

#### OSX
Ensure you have [brew](https://brew.sh) and the command line tools installed (comes automatically with XCode) and run:
```shell
brew update
brew upgrade
brew tap discoteq/discoteq; brew install flock
brew install autoconf autogen automake gcc@8 binutilsprotobuf coreutils wget python3
git clone https://github.com/ZDEEX-COIN/zdeex --branch master
cd zdeex
# This step is not required for when using the Qt GUI
./zcutil/fetch-params.sh

# -j8 = using 8 threads for the compilation - replace 8 with number of threads you want to use; -j$(nproc) for all threads available

#For CLI binaries
./zcutil/build-mac.sh -j8

#For qt GUI binaries
./zcutil/build-qt-mac.sh -j8
```

#### Windows
Use a debian cross-compilation setup with mingw for windows and run:
```shell
sudo apt-get install build-essential pkg-config libc6-dev m4 g++-multilib autoconf libtool ncurses-dev unzip git python python-zmq zlib1g-dev wget libcurl4-gnutls-dev bsdmainutils automake curl cmake mingw-w64
curl https://sh.rustup.rs -sSf | sh
source $HOME/.cargo/env
rustup target add x86_64-pc-windows-gnu

sudo update-alternatives --config x86_64-w64-mingw32-gcc
# (configure to use POSIX variant)
sudo update-alternatives --config x86_64-w64-mingw32-g++
# (configure to use POSIX variant)

git clone https://github.com/ZDEEX-COIN/zdeex --branch master
cd zdeex
# This step is not required for when using the Qt GUI
./zcutil/fetch-params.sh

# -j8 = using 8 threads for the compilation - replace 8 with number of threads you want to use; -j$(nproc) for all threads available

#For CLI binaries
./zcutil/build-win.sh -j8

#For qt GUI binaries
./zcutil/build-qt-win.sh -j8
```
**ZDEEX is experimental and a work-in-progress.** Use at your own risk.

To run the ZDEEX GUI wallet:

**Linux**
`zdeex-qt-linux`

**OSX**
`zdeex-qt-mac`

**Windows**
`zdeex-qt-win.exe`


To run the daemon for ZDEEX Chain:  
`zdeexd`
both zdeexd and zdeex-cli are located in the src directory after successfully building  

To reset the ZDEEX Chain blockchain change into the *~/.komodo/PIRATE* data directory and delete the corresponding files by running `rm -rf blocks chainstate debug.log komodostate db.log` and restart daemon

To initiate a bootstrap download on the GUI wallet add bootstrap=1 to the PIRATE.conf file.


**ZDEEX is based on Komodo which is unfinished and highly experimental.** Use at your own risk.

License
-------
For license information see the file [COPYING](COPYING).


Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
