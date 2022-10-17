#!/bin/bash

ROOT_DIR=$PWD

find -type f -name "cpuid.txt" | xargs grep -E 'SGX_LC:.+true$' | while read line; do
	CPUID_FILE=$(echo "$line" | cut -d':' -f1 | sed -E 's/ //g')
	CPU_NAME=$(cat $CPUID_FILE | grep 'brand =' | cut -d'=' -f2 | sed -E 's/ "|"//g')
	echo $CPU_NAME
done

