#!/bin/bash

function download(){
	echo "====== 1. staring download ======"
	echo ""
	wget -i download.txt
	echo ""
	echo "====== 2. download finished! ======"
}

download