#!/bin/bash

function checkPg(){
    echo "====== 1. start check pg ======"
	echo ""
	rpm -qa | grep postgres
	echo ""
	echo "====== 2. pg check finished! ======"
}

checkPg