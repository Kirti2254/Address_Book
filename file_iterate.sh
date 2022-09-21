#!/bin/bash

names="/home/kirti/shellscript/name"

for name in $(cat $names)
do
	echo My friends are $name
done


