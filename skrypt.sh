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

stworz_pliki_bledow() {
   for i in $(seq 1 $1); do
      nazwa_pliku=$(printf "error%03d.txt" $i)
      touch $nazwa_pliku
   done
}

wyswietl_sposob_uzycia() {
   echo "Sposób użycia: $0 [OPCJE]"
   echo ""
   echo "Opcje:"
   echo "  -d, --date          Wyświetl dzisiejszą datę"
   echo "  -l, --logs <ilość>  Utwórz określoną ilość plików log (domyślnie 100)"
   echo "  -h, --help          Wyświetl sposób użycia"
}

sklonuj_repo_i_dodaj_path() {
   git clone https://github.com/dsw52711/npbit1_l4
   export PATH="$PWD/npbit1_l4:$PATH"
}

flaga_daty=false
flaga_logow=false
flaga_bledow=false
flaga_inicjalizacji=false

ilosc_logow=100
ilosc_bledow=100

for argument in "$@"; do
   if [ "$argument" == "--help" ] || [ "$argument" == "-h" ]; then
      wyswietl_sposob_uzycia
      exit 0
   fi
done

while [[ $# -gt 0 ]]; do
   case $1 in
      --date|-d)
         flaga_daty=true
         shift
      ;;
      --logs|-l)
         flaga_logow=true
         shift
         if [[ $1 =~ ^[0-9]+$ ]]; then
            ilosc_logow=$1
            shift
         fi
      ;;
      --error|-e)
         flaga_bledow=true
         shift
         if [[ $1 =~ ^[0-9]+$ ]]; then
            ilosc_bledow=$1
            shift
         fi
      ;;
      --init)
         flaga_inicjalizacji=true
         shift
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

if $flaga_bledow: then
   stworz_pliki_bledow $ilosc_bledow
fi

if $flaga_inicjalizacji; then
   sklonuj_repo_i_dodaj_path
fi