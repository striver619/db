#!/bin/bash

function setupPg(){
    echo "====== 1. start installing pg ======"
	echo ""
	yum install $(cat pg.txt) -y
	echo ""
	echo "====== 2. pg installing finished! ======"
}

setupPg