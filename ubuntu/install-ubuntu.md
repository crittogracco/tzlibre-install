# Environments
This installation has been tested in Ubuntu 20.04 x64 on i386x64 and ARMx64 (Raspberry pi 4B) architectures.

<span style="color:red">__It doesn't work on ARMx32 (tested on Raspberry pi 2)__</span>

# Install OPAM and all other required packages
```
sudo apt install -y \
    net-tools rsync git m4 build-essential patch unzip \
    bubblewrap wget opam debianutils libev-dev \
    libgmp-dev libhidapi-dev perl pkg-config
```
Create a new user to run the node:
```
sudo useradd -m -s /usr/bin/bash tzlibre
```
# Download and compile TZLibre
Next steps as user tzlibre:
```
su tzlibre
git clone https://github.com/tzlibre/tzlibre
cd tzlibre
opam init --bare
make build-deps
eval $(opam env)
make
export PATH=~/tzlibre:$PATH
source ~/tzlibre/src/bin_client/bash-completion.sh
export TZLIBRE_CLIENT_UNSAFE_DISABLE_DISCLAIMER=Y
```
The above steps can take a lot of time, depending on your environment it can take about one hour, expecially on the raspberry pi.
# Start node
```
mkdir -p ~/tzlibre/logs
~/tzlibre/tzlibre-node identity generate
~/tzlibre/tzlibre-node config init
~/tzlibre/tzlibre-node
~/tzlibre/tzlibre-node config update --peer=123.321.123.321:9732 # => if you need to connect to a specific peer
mkdir -p ~/tzlibre/logs
nohup ~/tzlibre/tzlibre-node run --rpc-addr localhost:8732 > ~/tzlibre/logs/tzlibre-node.log &
```
# Checks
```
~/tzlibre/tzlibre-client bootstrapped
tail -c 10000 ~/tzlibre/logs/tzlibre-node.log
```
# Errors
This error appears after the successful installation on the raspberry pi 2 (ARMx32):
```
$ ~/tzlibre/tzlibre-node identity generate
Fatal error: exception (Invalid_argument Time.Protocol.of_notation)
Raised at file "stdlib.ml", line 34, characters 20-45
Called from file "src/bin_node/genesis_chain.ml", line 29, characters 4-56
```
# References
This wiki contains some useful tips to run a tezos node on the raspberry pi 3:

https://github.com/maxtez-raspbaker/tezos-rpi3/wiki