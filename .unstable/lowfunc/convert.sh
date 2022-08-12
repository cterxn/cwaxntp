#!/bin/bash
set -o pipefail

#export public=$1

#convert() {
#	local format=$2
	filename=$1
	public=$2
	ssh-keygen -e -m pkcs8 -f $public > ${filename}.pkcs8
#}
