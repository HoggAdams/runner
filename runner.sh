#!/bin/bash

# 判断是否有参数
if [ -z "$1" ];then
    echo "Sorry, the argument is invalid";
else
	# --use(-u) 运行文件
    if [ $1 == "-c" ] || [ $1 == "--compile" ];then
		filename=$2
		# python文件
		if [ ${filename#*.} == "py" ];then
			python3 $filename
		# C文件
		elif [ ${filename#*.} == "c" ];then
			gcc $filename
			./a.out
		# java文件
		elif [ ${filename#*.} == "java" ];then
			javac $filename
			java ${filename%%.*}
		# html文件 --> firefox
		elif [ ${filename#*.} == "html" ];then
			firefox $filename
		fi
	elif [ $1 == "-r*" ] || [ $1 == "--remove*" ];then
		# 检查是否存在Trash文件夹，如果没有则创建
		if [ ! -d "$HOME/Trash" ];then
  			mkdir $HOME/Trash
		fi
		# -re --> 清空Trash中的文件
		if [ $1 == "-re" ] || [ $1 == "--remove-empty" ];then
			rm -r $HOME/Trash/*
		# -rr text --> 恢复text文件
		elif [ $1 == "-rr" ] || [ $1 == "--remove-restore" ];then
				mv $HOME/Trash/$2 .
		# -r text --> 将text文件移入$HOME/Trash/中
		else
			mv $2 $HOME/Trash/ 
		fi
	elif [ $1 == "-i" ] || [ $1 == "--information" ];then
		./OS_information.sh
	elif [ $1 == "-g" ] || [ $1 == "--game" ];then
		echo "********************************"
		echo "==> 01. 奇异世界"
		echo "==> 02. 推箱子"
		echo "==> 03. 贪吃蛇"
		echo "==> 04. fork炸弹(不要轻易尝试)"
		echo "==> 05. Thanos(不要轻易尝试)"
		echo "********************************"
		echo "请选择你想要玩的游戏："
		read judge
		if [ $judge == "1" ] || [ $judge == "01" ];then
			bash $HOME/.config/runner/runner_奇异世界.sh
		elif [ $judge == "2" ] || [ $judge == "02" ];then
			bash $HOME/.config/runner/runner_推箱子.sh
		elif [ $judge == "3" ] || [ $judge == "03" ];then
			bash $HOME/.config/runner/runner_贪吃蛇.sh
		elif [ $judge == "4" ] || [ $judge == "04" ];then
			bash $HOME/.config/runner/runner_fork炸弹.sh
		elif [ $judge == "5" ] || [ $judge == "05" ];then
			bash $HOME/.config/runner/runner_Thanos.sh
		fi
	# --help(-h) 查看帮助
	elif [ $1 == "-h" ] || [ $1 == "--help" ];then
		echo "Hello World"
	fi
fi
