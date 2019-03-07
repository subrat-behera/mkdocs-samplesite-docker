#!/bin/bash

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
NC='\033[0m'


if [[ $1 = "produce" ]]; then
	echo -e "\n $YELLOW Producing the site $NC \n"
	cd mkdocsproject
	tar -zcvf $file_tar_gz.tar.gz $file_tar_gz
	exit;
fi

if [[ $1 = "serve" ]]; then
	echo -e "\n $YELLOW Serving the site $NC \n"
	cd mkdocsproject
	tar xvzf $file_tar_gz
	archive_dir=`echo $file_tar_gz | cut -d . -f1`
	cd $archive_dir
	mkdocs serve -a 0.0.0.0:8000
fi
