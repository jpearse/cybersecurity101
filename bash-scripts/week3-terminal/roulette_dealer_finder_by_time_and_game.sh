#!/bin/bash

declare -A game_shortcut
game_shortcut[B]=2
game_shortcut[R]=3
game_shortcut[T]=4

declare -A game_name
game_name[B]=BlackJack
game_name[R]=Roulette
game_name[T]=Texas_Hold_EM

echo -n "Enter a date (MMDD): "
read indate
echo -n "Enter a time (HH:MM:SS AM|PM): "
read intime
echo -n "Enter a game (B, R, T): "
read ingame

if [[ -z $indate || -z $intime || -z $ingame ]]; then
	echo "Please input a date, time and game to complete search"
	exit
fi


cd /home/sysadmin/HW3/Lucky_Duck_Investigations/Roulette_Loss_Investigation/Dealer_Analysis

DATED_FILE=$indate"_Dealer_schedule"

if [[ ! -e $DATED_FILE ]]; then
	echo "No log file for date: "$indate
	exit
fi

for key in "${!game_shortcut[@]}"; do
	if [[ $ingame == "all" || $ingame == $key ]]; then
		echo ${game_name[$key]}
		awk -F '\t' -v reg=${game_shortcut[$key]} '{ print $1, $reg }' $DATED_FILE | grep  "${intime}"
	fi
done




