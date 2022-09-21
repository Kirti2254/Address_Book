#!/bin/bash

echo Hi User, Welcome to Senior Citizen Membership
echo What is your age?
read age


if [ $age -ge 70 ]
then 
	echo You are welcome to the team!
else
	echo Sorry you are not senior citizen!
fi

