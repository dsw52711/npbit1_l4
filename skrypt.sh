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

wyswietl_sposob_uzycia() {
   echo "Sposób użycia: $0 [--date] [--logs [ilość]] [--help]"
   echo ""
   echo "--date          Wyświetl dzisiejszą datę"
   echo "--logs [ilość]  Utwórz określoną ilość plików log (domyślnie 100)"
   echo "--help          Wyświetl sposób użycia"
}

flaga_daty=false
flaga_logow=false
ilosc_logow=100

for argument in "$@"; do
   if [ "$argument" == "--help" ]; then
      wyswietl_sposob_uzycia
      exit 0
   fi
done

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