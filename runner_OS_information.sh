#!/bin/bash
#Program function: A shell script to monitor network, disk usage, uptime, load average and RAM usage in Linux.
reset_terminal=$(tput sgr0)
clear
if [[ $# -eq 0 ]]
then
# Check OS Type
    os_type=$(uname -o)
    echo -e '\e[0;1;95m'"OS Type:"'\e[0m' $os_type
# Check OS Release Version and Name
    os_release=$(lsb_release -a | grep 'Description' --color=never | cut -f 2)
    echo -e '\e[0;1;95m'"OS Release Version and Name:"'\e[0m' $os_release
# Check Architecture
    os_architecture=$(uname -m)
    echo -e '\e[0;1;95m'"OS Architecture:"'\e[0m' $os_architecture
# Check Kernel Release
    os_kernel=$(uname -r)
    echo -e '\e[0;1;95m'"OS Kernel:"'\e[0m' $os_kernel
# Check hostname
    os_hostname=$(uname -n)
    echo -e '\e[0;1;95m'"OS Hostname:"'\e[0m' $os_hostname
# Check Internal IP
    os_internal_ip=$(hostname -I)
    echo -e '\e[0;1;95m'"OS Internal IP:"'\e[0m' $os_internal_ip
# Check External IP
    os_external_ip=$(curl -s http://myip.ipip.net/ | sed 's/[：, ]/:/g' | cut -f 3 -d ":")
    echo -e '\e[0;1;95m'"OS External IP:"'\e[0m' $os_external_ip
# Check DNS
    os_dns=$(cat /etc/resolv.conf | grep -E "\<nameserver[ ]+" | awk '{print $NF}')
    echo -e '\e[0;1;95m'"OS DNS:"'\e[0m' 
    echo $os_dns
# Check if connected to Internet or not
    echo -e '\e[0;1;95m'"OS Connected:"'\e[0m' $os_connected
    ping -c 2 www.baidu.com &> /dev/null && echo "Internet:Connected" || echo "Internet:Disconnected"
# Check Logged In Users
    echo -e '\e[0;1;95m'"OS Logged Users:"'\e[0m'
    who

#########################

# sys_mem_usage
    sys_men_usage=$(awk '/MemTotal/{total=$2}/MemFree/{free=$2}END{print (total-free)/1024}' /proc/meminfo)
    echo -e '\e[0;1;95m'"System Memory Usage:"'\e[0m' $sys_men_usage "MB"
# app_men_usage
    app_men_usage=$(awk '/MemTotal/{total=$2}/MemFree/{free=$2}/^Cached/{cached=$2}/Buffers/{buffers=$2}END{print (total-free-cached-buffers)/1024}' /proc/meminfo)
    echo -e '\e[0;1;95m'"Application Memory Usage:"'\e[0m' $app_men_usage "MB"
# load
    load_average=$(top -n 1 -b | grep "load average:" | awk '{print "1min:" $12 "  " "5min:" $13 "  " "15min:" $14}')
    echo -e '\e[0;1;95m'"CPU Load Average:"'\e[0m' $load_average
# disk usage
    echo -e '\e[0;1;95m'"Disk Usage:"'\e[0m'
    df -hP | grep -vE 'Filesystem|tmpfs' | awk '{print $1 " " $3 " " $5}'
fi

