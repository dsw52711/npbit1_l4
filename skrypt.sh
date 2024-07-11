#!/usr/bin/bash

stworz_pliki_log() {
   nazwa_skryptu=$(basename "$0")
   data=$(date)

   for i in {1..100}; do
      nazwa_pliku=$(printf "log%03d.txt" $i)
      echo "Nazwa pliku: $nazwa_pliku" > $nazwa_pliku
      echo "Utworzony przez: $nazwa_skryptu" >> $nazwa_pliku
      echo "Data: $data" >> $nazwa_pliku
   done
}

flaga_daty=false
flaga_logow=false

for argument in "$@"; do
  case $argument in
    --date) flaga_daty=true ;;
    --logs) flaga_logow=true ;;
    *) ;;
  esac
done

if $flaga_daty; then
  date
fi

if $flaga_logow; then
  stworz_pliki_log
fi