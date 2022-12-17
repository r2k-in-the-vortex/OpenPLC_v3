LLVM_VER=13

LLVM_DISTRO_VERSION=bullseye

sudo touch /etc/apt/sources.list.d/llvm.list
echo "deb http://apt.llvm.org/$LLVM_DISTRO_VERSION/ llvm-toolchain-$LLVM_DISTRO_VERSION-$LLVM_VER  main" | sudo tee -a /etc/apt/sources.list.d/llvm.list

wget -O - https://apt.llvm.org/llvm-snapshot.gpg.key | sudo apt-key add -

sudo apt-get update

sudo apt-get install -y cargo

sudo apt-get install -y zip llvm-$LLVM_VER-tools llvm-$LLVM_VER-runtime llvm-$LLVM_VER libllvm$LLVM_VER libclang-cpp$LLVM_VER clang-$LLVM_VER lldb-$LLVM_VER lld-$LLVM_VER clangd-$LLVM_VER liblld-$LLVM_VER-dev llvm-$LLVM_VER-dev

cargo install mdbook grcov

cargo install cargo-insta cargo-watch 