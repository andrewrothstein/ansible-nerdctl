#!/usr/bin/env bash
set -e
readonly DIR=~/Downloads
readonly MIRROR=https://github.com/containerd/nerdctl/releases/download

# https://github.com/containerd/nerdctl/releases/download/v0.20.0/SHA256SUMS
# https://github.com/containerd/nerdctl/releases/download/v0.20.0/nerdctl-0.20.0-linux-amd64.tar.gz

dl()
{
    local lchecksum=$1
    local ver=$2
    local os=$3
    local arch=$4
    local archive_type=${5:-"tar.gz"}
    local platform="${os}-${arch}"
    local file=nerdctl-${ver}-${platform}.${archive_type}
    local url=$MIRROR/v${ver}/$file
    printf "    # %s\n" $url
    printf "    %s: sha256:%s\n" $platform $(grep $file $lchecksum | awk '{print $1}')
}

dl_ver () {
    local ver=$1
    local checksum_url=${MIRROR}/v${ver}/SHA256SUMS
    printf "  # %s\n" $checksum_url
    local lchecksum=$DIR/nerdctl_${ver}_SHA256SUMS.txt

    if [ ! -e $lchecksum ];
    then
        curl -sSLf -o $lchecksum $checksum_url
    fi

    printf "  '%s':\n" $ver
    dl $lchecksum $ver freebsd amd64
    dl $lchecksum $ver linux amd64
    dl $lchecksum $ver linux arm-v7
    dl $lchecksum $ver linux arm64
    dl $lchecksum $ver linux ppc64le
    dl $lchecksum $ver linux riscv64
    dl $lchecksum $ver linux s390x
    dl $lchecksum $ver windows amd64
}

dl_ver ${1:-1.6.2}
