#!/usr/bin/env bash
set -e
source `dirname $0`/basicFunctions.inc

BASE_DIR=".."
VM_DEV_DIR="$BASE_DIR/opensmalltalk-vm/image"

pushd $VM_DEV_DIR
source get64VMName.sh

if [ "$1" = "interpreter" ]    
then
	INFO "Generating Interpreter Sources"
    $VM -headless $BASE.image ../../scripts/Smalltalk/buildInterpreterSources.st
else  
	INFO "Generating JIT Sources"
    $VM -headless $BASE.image ../../scripts/Smalltalk/buildJitSources.st
fi

OK "done"
popd > /dev/null

