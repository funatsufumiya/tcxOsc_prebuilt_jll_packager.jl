#!/bin/bash

cd `dirname $0`
NAME="tcxOsc_prebuilt_jll"
VERSION=$(git describe --tags --abbrev=0)
# GIT_SHA1=$(git rev-parse "$VERSION")
URL=https://github.com/funatsufumiya/tcxOsc_prebuilt_jll_packager.jl/releases/download/$VERSION

function gen(){
    OS=$1
    ARCH=$2
    FILE=$OS-$ARCH.tar.gz
    SHA256=$(sha256sum $OS-$ARCH.tar.gz | awk '{print $1}')

    rm -rf tmp
    mkdir tmp
    cd tmp
    tar xf ../$FILE
    GIT_SHA1=$(julia -e 'using Pkg; print(bytes2hex(Pkg.GitTools.tree_hash(pwd())))')
    cd ..
    rm -rf tmp

    echo "[[$NAME]]"
    echo "git-tree-sha1 = \"$GIT_SHA1\""
    echo "os = \"$OS\""
    echo "arch = \"$ARCH\""
    echo
    echo "    [[$NAME.download]]"
    echo "    sha256 = \"$SHA256\""
    echo "    url = \"$URL/$FILE\""
    echo ""
}

gen "macos" "aarch64"
gen "linux" "x86_64"
gen "windows" "x86_64"