#!/bin/bash
set -o pipefail
set +o posix
.  ./lowfunc/*.sh --source-only
#.  ./lowfunc/*.sh $2 pkcs8 $public
function general_err() {
        echo "ERROR!:$@"
        exit 1
    }

#verify_file() {
        file=$2
        sig=${file}.sig
	inputpublic=$1
	pkcs8=`convert $file $inputpublic`


	[[  -e $file ]] || general_err "Couldn't find file: $file!"
        [[  -e $sig ]] || general_err "Couldn't find signature file: $sig!"

        if [[ ! -e $pkcs8 ]]; then
            general_err "Couldn't find your public key: $pkcs8!. Try $0 -p $actual_profile -g to generate one"
        fi
        echo "Verifying $file with your public key $pkcs8"

        openssl dgst -SHA256 -verify $pkcs8 -signature "$sig" "$file" || exit $? && echo a
 #  }
#main(){
#	verify_file $1 $2
#	}
