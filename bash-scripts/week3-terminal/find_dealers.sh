#!/bin/bash

LOSSFILE=player_loss_times
EVFILE=Dealers_working_during_losses

:> $EVFILE

while IFS= read -r line
do
	logprefix=$(echo $line | cut -d' ' -f1)
	timestamp=$(echo $line | cut -d' ' -f2,3)

	logfile=$logprefix"_Dealer_schedule"

	awk -F '\t' '{print $1, $3}' $logfile | grep "$timestamp" >> $EVFILE

done < "$LOSSFILE"
