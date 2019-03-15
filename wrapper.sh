#!/bin/bash

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
NC='\033[0m'

# Help function
display_help() {

	echo -e "$GREEN Usage: $0 [arg]">&2
	echo
    	echo
    	echo "ARGUMENTS"
    	echo "   -p, --path              Absolute path of the following"
      echo "                            => Root directory of an mkdocs project"
      echo "                            => tar.gz file which has to be served"
    	echo "   -a, --action            Action to be performed by the script and can have below values"
      echo "                            => produce : To produce a mkdocs site"
      echo "                            => serve : To serve a mkdocs site and can be accessed at http://localhost:8000"
	echo -e "Example : ./wrapper.sh -p <path to the root of the directory> -a <produce|serve> $NC"

}


while :
do
    case "$1" in
            -h | --help)
              display_help
              exit 0
              ;;
            -p | --path)
              if [[ $2 = '' ]];then
		          display_help
                exit 1
              fi
              path="$2"
              echo $path
	            shift 2
              ;;
            -a | --action)
              if [[ $2 = '' ]];then
		          display_help
                exit 1
              fi
	            action="$2"
              echo $action
              shift 2
              ;;
            --) # End of all options
              shift
              break
              ;;
            -*)
              echo -e "$RED Error: Unknown option: $1 $NC" >&2
	            display_help
              exit 1
              ;;
           *)#No more options
           #   display_help
           #exit 1
	   break
	   ;;
    esac
done

# Check whether arguments are not null
if [[ $path = "" ]] || [[ $action = "" ]]; then
	echo -e "\n $RED one of the argument is null $NC \n"
	display_help
	exit;
fi

# Main segment which spins up the mkdocs container and serve the webpage on browser.
echo -e "\n $GREEN Computing properties to produce site $NC \n"
dir_mkdoc_config=`dirname $path`
file_name_tar_gz=`basename $path`
echo $dir_mkdoc_config
echo $file_name_tar_gz
docker run -p 8000:8000 -v $dir_mkdoc_config:/mkdocsproject -e dir_config=$dir_mkdoc_config -e file_tar_gz=$file_name_tar_gz mkdocs-samplesite-docker:latest $action
exit;
