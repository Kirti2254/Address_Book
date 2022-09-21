#!/bin/bash

echo Press any option
echo 1=Show date
echo 2=List files in current directory
echo 3=Show current path

read choice

case $choice in 
	1)date;;
	2)ls -ltr;;
	3)pwd;;
	*)echo Invalid input
esac
