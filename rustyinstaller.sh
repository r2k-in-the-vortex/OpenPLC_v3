# this works on debian, any other platform you are on your own

# llvm dependencies
LLVM_VER=13
LLVM_DISTRO_VERSION=bullseye

sudo apt-get install build-essential


curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

sudo rm /etc/apt/sources.list.d/llvm.list
echo "deb http://apt.llvm.org/$LLVM_DISTRO_VERSION/ llvm-toolchain-$LLVM_DISTRO_VERSION-$LLVM_VER  main" | sudo tee -a /etc/apt/sources.list.d/llvm.list

wget -O - https://apt.llvm.org/llvm-snapshot.gpg.key | sudo apt-key add -

sudo apt-get update


sudo apt-get install -y zip llvm-$LLVM_VER-tools llvm-$LLVM_VER-runtime llvm-$LLVM_VER libllvm$LLVM_VER libclang-cpp$LLVM_VER clang-$LLVM_VER lldb-$LLVM_VER lld-$LLVM_VER clangd-$LLVM_VER liblld-$LLVM_VER-dev llvm-$LLVM_VER-dev
sudo apt-get install -y libz-dev
sudo apt-get install -y cargo

cargo install mdbook grcov

cargo install cargo-insta cargo-watch 

cd utils/rusty

cargo build --release

sudo cp target/release/rustyc /usr/bin/rustyc

cd ../..