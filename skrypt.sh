#!/usr/bin/bash

stworz_pliki_log() {
   nazwa_skryptu=$(basename "$0")
   data=$(date)

   for i in $(seq 1 $1); do
      nazwa_pliku=$(printf "log%03d.txt" $i)
      echo "Nazwa pliku: $nazwa_pliku" > $nazwa_pliku
      echo "Utworzony przez: $nazwa_skryptu" >> $nazwa_pliku
      echo "Data: $data" >> $nazwa_pliku
   done
}

flaga_daty=false
flaga_logow=false
ilosc_logow=100

while [[ $# -gt 0 ]]; do
   case $1 in
      --date)
         flaga_daty=true
         shift
      ;;
      --logs)
         flaga_logow=true
         shift
         if [[ $1 =~ ^[0-9]+$ ]]; then
            ilosc_logow=$1
            shift
         fi
      ;;
      *)
         shift
      ;;
   esac
done

if $flaga_daty; then
   date
fi

if $flaga_logow; then
   stworz_pliki_log $ilosc_logow
fi