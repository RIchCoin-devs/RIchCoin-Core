RIchCoin [XRI] Source Tree
================================
```
|_   _| |__   ___   / ___|___ (_)_ __     ___  / _|   __ _  | __ )  ___| |_| |_ ___ _ __   / \   __ _  ___
  | | | '_ \ / _ \ | |   / _ \| | '_ \   / _ \| |_   / _` | |  _ \ / _ \ __| __/ _ \ '__| / _ \ / _` |/ _ \
  | | | | | |  __/ | |__| (_) | | | | | | (_) |  _| | (_| | | |_) |  __/ |_| ||  __/ |   / ___ \ (_| |  __/
  |_| |_| |_|\___|  \____\___/|_|_| |_|  \___/|_|    \__,_| |____/ \___|\__|\__\___|_|  /_/   \_\__, |\___|
                                                                                                |___/    
```

Specifications:
--------------
Specification | Value
--- | ---
Protocol | PoW (Proof of Work)
Symbol |  `XRI`
Algorithms | scrypt, x17, Lyra2rev2, myr-groestl, & blake2s
Blocktime | 60 seconds
RPC port | `20203`
P2P port | `21203`
Total Supply | N.A.
Pre-mine | N.A.
ICO | N.A.
Block Explorer | http://54.169.192.23:3001
Official Website | https://richcoin-devs.github.io
Server | Everywhere


Block Rewards
-----------------
Block Range | Block Reward | Circulating Supply | Months after Release
--- | --- | --- | ---
0 - 44,000 | 1440 XRI | 63,360,000 XRI | 1
44,000 - 176,000 | 720 XRI | 158,400,000 XRI | 4
176,000 - 440,000 | 360 XRI | 253,440,000 XRI | 10
440,000 - 968,000 | 180 XRI | 348,480,000 XRI | 22
968,000 - 1,760,000 | 90 XRI | 419,760,000 XRI | 40
1,760,000 - 2,816,000 | 45 XRI | 467,280,000 XRI | 64
2,816,000 - 4,224,000 | 24 XRI | 499,664,000 XRI | 96

* After 4,224,000 blocks, block rewards will be dictated by network hash difficulty as such:

Block Range | Block Reward | Circulating Supply | Months after Release
--- | --- | --- | ---
n |  ((Average Block Difficulty + (n - 4224000)) //  4) XRI | Infinity | Infinity

Using RIchCoin on Windows
-------------
1. Download the pre-compiled software labelled <RIchCoin-Core-X.X.X-windows.zip>. (from our [RIchCoin-Core releases](https://github.com/RIchCoin-devs/RIchCoin-Core/releases)) and unzip the file.
2. Install
3. In Windows File Explorer, open c:\Users\XXX\AppData\Roaming\RIchCoin (be sure to change XXX to your windows user)
4. Right click and create a new file RIchCoin.txt
5. Edit the file to have contents below (see [instructions below](https://github.com/RIchCoin-devs/RIchCoin-Core#creating-a-configuration-file) for options)
6. Save and close the file.
7. Rename the file to RIchCoin.conf.
8. Start the RIchCoin-qt.exe program.
9. Open up RIchCoin-qt debug window in Help > Debug Window and run ```getinfo``` (or ```getmininginfo```) to verify settings.

**Note:** You must restart the wallet after making changes to RIchCoin.conf.

Using RIchCoin on Mac OS X
---------------------------
1. Download the pre-compiled software labelled <RIchCoin-Core-X.X.X-macosx.dmg>. (from our [RIchCoin-Core releases](https://github.com/RIchCoin-devs/RIchCoin-Core/releases)).
2. Double-click the dmg file to create the app. Then, a prompt will appear.
3. As the prompt states, drag the RIchCoin-qt icon on the prompt into the Applications icon on the prompt.
4. When it is done transferring, you may eject the dmg file like any other drive and start the RIchCoin-Qt wallet by double-clicking it in your Applications folder.
5. Move on to creating a configuration file (see [instructions below](https://github.com/RIchCoin-devs/RIchCoin-Core#creating-a-configuration-file)).

**Note:** You must restart the wallet after making changes to RIchCoin.conf.

Compiling Linux Wallet on Ubuntu/Debian
--------------------------------------

1. Install the dependencies.

```sudo apt-get update```

```sudo apt-get install libdb-dev libdb++-dev build-essential libtool autotools-dev automake pkg-config libssl1.0-dev libevent-dev bsdmainutils git libboost-all-dev libminiupnpc-dev libqt5gui5 libqt5core5a libqt5webkit5-dev libqt5dbus5 qttools5-dev qttools5-dev-tools libprotobuf-dev protobuf-compiler libqrencode-dev```

**Note**: You will need to make sure you do not have differing versions of libdb(++) installed.

**Note**: If you are on debian, you will also need to `apt-get install libcanberra-gtk-module`.

2. Clone the git repository and compile the daemon and gui wallet:

```git clone https://github.com/RIchCoin-devs/RIchCoin-Core.git && cd RIchCoin-Core && ./autogen.sh && ./configure --with-incompatible-bdb && make```

if you are using source-build libdb4.8(++)-dev you may need to use

```./configure  CPPFLAGS="-I/usr/local/BerkeleyDB.4.8/include -O2" LDFLAGS="-L/usr/local/BerkeleyDB.4.8/lib"```

**Note**: If you get a "memory exhausted" error, make a swap space on your boot drive.

Compiling Mac Wallet on MacOS:
------------------------------
**Note**: This step is not needed if you have already downloaded the per-installed Mac .dmg files

1. Download the wallet source and install requirements with Homebrew:

    `git clone https://github.com/RIchCoin-devs/RIchCoin-Core.git`

    `cd RIchCoin-Core`
    
    `sh ./building/mac/requirements.sh`

2. Proceed to build the RIchCoin daemon and wallet:

    `sh ./building/common.sh`

    `sh ./building/mac/build.sh`
    
3. Move on to building the Mac installer.


Building the Mac installer (.dmg) file
----------------------------------------
Run  `sh ./building/mac/dist.sh`.

If you are building the .dmg and you get an error regarding my sql, you may need to run these commands:

    brew install mysql

    cd /usr/local/opt/qt@5.5/plugins/sqldrivers

    otool -L libqsqlmysql.dylib

**Note**: This may be pointing to an version of mysql that you do not have installed (like mysql55) - Alternatively, you may be able to remove the library from the sqldrivers folder.

    install_name_tool -change /opt/local/lib/mysql55/mysql/libmysqlclient.18.dylib /usr/local/Cellar/mysql/5.7.12/lib/libmysqlclient.20.dylib libqsqlmysql.dylib

**Note**: You may also run into issues when using `macdeployqtplus` to create the bundle, and the library will not bundle all of the boost dylibs. It's highly recommended to use the functions provided inside of [dylib-fixes.sh](/building/mac/dylib-fixes.sh)

Trying to build .dmg on Mac OS X 10.8? You will also need to run this:

    export CFLAGS=-Qunused-arguments

    export CPPFLAGS=-Qunused-arguments

    sudo -E easy_install appscript

Accessing the wallet (Linux & Mac):
-----------------------------------
The gui wallet is in ./RIchCoin-Core/src/qt as RIchCoin-qt and the daemon(background) wallet as RIchCoind in ./RIchCoin/src.

**Note**: If you see something like 'Killed (program cc1plus)' run ```dmesg``` to see the error(s)/problems(s). This is most likely caused by running out of resources. You may need to add some RAM or add some swap space.

**Optional**:
If you want to copy the binaries for use by all users, run the following commands:

```sudo cp src/RIchCoind /usr/bin/```

```sudo cp src/qt/RIchCoin-qt /usr/bin/```

Creating a Configuration File
------------------------------
For Windows users, open the RIchCoin.conf file in ```c:\Users\XXX\AppData\Roaming\RIchCoin``` you created earlier.

For Linux users, in the terminal, type:

```nano ~/.RIchCoin/RIchCoin.conf```

For Mac OS users, in the terminal, type:

```nano ~/Library/Application\Support\RIchCoin\RIchCoin.conf```

Enter a username and password into the RIchCoin.conf like this: (It is recommended to change the password to something unique.)

    rpcuser=RIchcoinRPCusername
    rpcpassword=85CpSuCNvDcYsdQU8w621mkQqJAimSQwCSJL5dPT9wQX

Add `daemon=1` , `rpcport=20203`, `port=21203`, `daemon=1`, and `algo=scrypt` to the configuration file.

In the end, your config should look something like this:

    rpcuser=RIchcoinRPCusername
    rpcpassword=85CpSuCNvDcYsdQU8w621mkQqJAimSQwCSJL5dPT9wQX
    rpcport=20203
    port=21203
    daemon=1
    algo=scrypt

Mac and Linux: Exit the RIchCoin.conf by pressing `ctrl + x` on your keyboard then pressing `y` and hitting enter. This will have created a RIchCoin.conf file with what you just added.

Next, start your qt or daemon wallet and you should start downloading and syncing with the blockchain.

To check the status of how much of the blockchain has been downloaded (aka synced) with your daemon, start your daemon and type:
`RIchCoind.exe getinfo` (for Windows users)
`./RIchCoind getinfo` (for Mac and Linux users who compiled, once again)

As for the QT wallet, open the RIchCoin-qt app, open the debug window in Help > Debug window, and enter `getinfo`.

"Solo-mining" from your wallet?
----------
The wallet has a built-in CPU miner. You need to specify the algorithm in your .conf file and set the "gen" flag. For instance, in the configuration specify ```gen=1```. You can also type ```setgenerate true``` in the debug window of the qt-wallet.

Alternatively, just open the debug window in your qt-wallet and type `setgenerate true` into the console.

Using different mining algorithms
----------
To use a specific mining algorithm use the `algo` switch in your configuration file (.conf file) or from the command line (like this `--algo=x17`) Here are the possible values:

    algo=x17
    algo=scrypt
    algo=groestl
    algo=lyra
    algo=blake

GPU mining
----------
If you want to try GPU mining, look at [our wiki](https://github.com/RIchCoin-devs/RIchCoin-Core/wiki) to see the GPU mining guides.

Troubleshooting and FAQ
------------------------
If you are having problems or have any questions, do consult the [troubleshooting guide](https://github.com/RIchCoin-devs/RIchCoin-Core/wiki/Troubleshooting) and [FAQ section](https://github.com/RIchCoin-devs/RIchCoin-Core/wiki/FAQ) in our wiki.
If you have any questions or problems that haven't been listed, direct them to richcoin.xri@gmail.com.

Thanks
----
Special Thanks to:
* SHIELD Devs
* VERGE Devs
* Tor Devs
* i2p Devs
* Bitcoin Devs
