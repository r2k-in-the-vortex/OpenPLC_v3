# this works on debian, any other platform you are on your own

sudo apt-get install -y build-essential curl

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
exec bash rustyinstallerstage2.sh
