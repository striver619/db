#!/bin/bash

func_host_os(){
    echo -e "\n==== 1. OS Version ====\n"
    cat /etc/system-release
}

func_host_arch(){
    echo -e "\n==== 2. CPU Architecture ====\n"
    arch
}

func_pull_matrixdb_image(){
    echo -e "\n==== 3. pull matrixdb image ====\n"
    docker pull matrixdb/centos7_demo
}

func_check_matrixdb_image(){
    echo -e "\n==== 4. check matrixdb image Version ====\n"
    docker images|grep "matrixdb"
}

func_run_matrixdb_container(){
    echo -e "\n==== 5. run matrixdb container ====\n"
    docker run -dit \
	    -p 5432:5432 \
	    -p 8240:8240 \
	    --name mxdemo \
	    matrixdb/centos7_demo
}

func_check_matrixdb_container(){
    echo -e "\n==== 6. check matrixdb container status ====\n"
    docker ps|grep "matrixdb"
}

func_exec_matrixdb_container(){
    echo -e "\n==== 7. come in matrixdb container by mxadmin account ====\n"
    docker exec -it \
	    -u mxadmin \
	    $(docker ps|grep "matrixdb"|xargs |awk '{print $1}') \
	    /bin/bash
}

func_host_os
func_host_arch
# func_pull_matrixdb_image
func_check_matrixdb_image
# func_run_matrixdb_container
func_check_matrixdb_container
func_exec_matrixdb_container

