#!/bin/bash

################
#Coint counter - počítání mincí
#Krok 1 - základní algoritmus
#Skript bere jako argument číslo a vypíše minimální počet mincí, ve kterých lze sumu vrátit
#Mince jsou v CZK: 50,20,10,5,2,1
#Skript nemá ošetřené vstupy, jediný možný vstup je kladné celé číslo
################

VAL=$1

while true; do
    if [[ "$VAL" =~ ^[0-9]+$ ]]; then
        break
    fi
    
    echo "Vstupní hodnota neexistuje nebo není kladným celým číslem."
    read -p "Zadej hodnotu: " VAL
done

if [ $VAL -eq 0 ];then
    echo "Hodnota je 0"
    exit
fi

for COIN in 50 20 10 5 2 1
do
    HODNOTA=$(($VAL / $COIN))
    VAL=$(($VAL % $COIN))
    echo "Počet mincí hodnoty $COIN:" $HODNOTA
done
