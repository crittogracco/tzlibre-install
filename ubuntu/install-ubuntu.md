# Environments
This installation has been testen in Ubuntu 20.04 x64 on i386x64 and ARMx64 (Raspberry pi 4B) architectures
In doesn't work on ARMx32 (tested on Raspberry pi 2) 
# Install OPAM and needed packages
```
sudo apt install -y net-tools rsync git m4 build-essential patch unzip bubblewrap wget opam debianutils libev-dev libgmp-dev libhidapi-dev perl pkg-config
sudo useradd -m -s /usr/bin/bash tzlibre
```
# Download and compile TZLibre
Next steps as user tzlibre
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
On Raspi 2 (ARMx32):
```
$ ~/tzlibre/tzlibre-node identity generate
Fatal error: exception (Invalid_argument Time.Protocol.of_notation)
Raised at file "stdlib.ml", line 34, characters 20-45
Called from file "src/bin_node/genesis_chain.ml", line 29, characters 4-56
```