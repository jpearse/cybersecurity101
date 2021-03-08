#!/bin/bash

echo -n "Enter a date (MMDD): "
read indate
echo -n "Enter a time (HH:MM:SS AM|PM): "
read intime

if [[ -z $indate || -z $intime ]]; then
	echo "Please input a time and date to complete search"
	exit
fi

cd /home/sysadmin/HW3/Lucky_Duck_Investigations/Roulette_Loss_Investigation/Dealer_Analysis

DATED_FILE=$indate"_Dealer_schedule"

if [[ ! -e $DATED_FILE ]]; then
	echo "No log file for date: "$indate
	exit
fi

FIND_DEALER=$(awk -F '\t' '{ print $1, $3 }' $DATED_FILE | grep  "${intime}")
if [[ -n $FIND_DEALER ]]; then
	echo $FIND_DEALER
else
	echo "No dealer found for timestamp "$intime
fi

