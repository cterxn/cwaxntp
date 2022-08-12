function error_exit {
  echo "$1" 1>&2
  exit 1
}

function general_err() {
        echo "ERROR!:$@"
        exit 1
    }
