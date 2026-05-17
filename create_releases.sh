#!/bin/bash

LIB=libTcxOscJl

function create_tar_gz() {
    target=$1
    ext=$2
    name_arg=$3
    name=${name_arg:="$LIB"}
    echo "creating $target.tar.gz from $name.$ext"
    rm -rf $target
    mkdir $target
    mkdir $target/lib
    mkdir $target/include
    cp libs/$name.$ext $target/lib
    cd $target
    tar czf ../$target.tar.gz *
    cd ..
    rm -rf $target
}

cd `dirname $0`
echo "working dir: $(pwd)"
rm -rf *.tar.gz
create_tar_gz "macos-aarch64" "dylib"
create_tar_gz "linux-x86_64" "so"
create_tar_gz "windows-x86_64" "dll"