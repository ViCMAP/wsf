#!/usr/bin/sh
set -e

if test ! -z $1; then
export DIL=`pwd`/$1
else
export DIL=`pwd`/deploy
fi


cd wsf_c/build/codegen
mvn clean install -Drelease
cd modules/distribution/target/ 
unzip wsf-cpp-1.0-bin.zip
cd wsf-cpp-1.0
if [ -a $DIL/bin/codegen ] ; then
	cp -rf lib $DIL/bin/codegen
else
	if test ! -a $DIL/bin  ; then 
		mkdir $DIL/bin
	fi
	if test ! -a $DIL/bin/codegen ; then
		mkdir $DIL/bin/codegen
	fi
	cp -rf lib $DIL/bin/codegen/lib
fi

cd ../../../../../../../
cp -rf `pwd`/tools/codegen/wsdl2cpp $DIL/bin/codegen/wsdl2cpp
