#!/bin/bash
echo "表示当前程序名称"
echo $0 
echo "表示当前进程编号"
echo $$ 
echo "表示变量的个数，常用于循环"
echo $# 
echo "表示最近一个后台命令的进程编号"
echo $! 
echo "当前命令行所有参数。置于双引号中，表示将命令行所有参数当初一个单独参数"
echo $* 
echo "当前命令行所有参数。置于双引号中，表示个别参数"
echo $@ 
echo "（连字号）    在引用数给予Shell的选项"
echo $- 
echo $HOME 
echo $IFS
echo $PATH
echo $PPID
echo $PWD
