#!/bin/sh

#env GOOS=linux GOARCH=arm go build -v -o bin/edgetrace-linux-arm ../edgetrace/client/main.go

bindir="bin"
source="../edgetrace/client/main.go"

rm $bindir/edgetrace-*

ARCHS="darwin-amd64 freebsd-386 freebsd-amd64 freebsd-arm linux-386 linux-amd64 linux-arm windows-386 windows-amd64"

echo "Building packages"
for platform in $ARCHS
do
	os=`echo $platform | awk -F "-" '{print $1}'`
	arch=`echo $platform | awk -F "-" '{print $2}'`

	echo "                 $os $arch $bindir/edgetrace-$os-$arch"

	env GOOS=$os GOARCH=$arch go build -o $bindir/edgetrace-$os-$arch $source

done
