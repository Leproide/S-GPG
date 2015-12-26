#!/bin/bash

#    S-GPG - The easiest way to use PGP/GPG
#    Copyright (C) 2015-2016
#    Script by Leprechaun
#
#    This program is free software: you can redistribute it and/or modify
#    it under the terms of the GNU General Public License as published by
#    the Free Software Foundation, either version 3 of the License, or
#    (at your option) any later version.
#
#    This program is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU General Public License for more details.
#
#    You should have received a copy of the GNU General Public License
#    along with this program.  If not, see <http://www.gnu.org/licenses/>.
#
#
#    E-Mail: leproide@paranoici.org
#    PGP: https://pgp.mit.edu/pks/lookup?op=get&search=0x8FF24099181CE01E

# -------------------------------------------------------------------------------


clear
while true
do
tput setaf 4; tput bold;
echo '  _________           __________________  ________ '
echo ' /   _____/          /  _____/\______   \/  _____/ '
echo ' \_____  \   ______ /   \  ___ |     ___/   \  ___ '
echo ' /        \ /_____/ \    \_\  \|    |   \    \_\  \'
echo '/_______  /          \______  /|____|    \______  /'
echo '        \/                  \/                  \/ '

tput setaf 1; tput bold;
echo -e "\nSimple-GPG by Leprechaun"
echo
tput setaf 2; tput bold;
echo "Utilizza la chiave di:"
tput sgr0 
read utente
tput bel
clear

tput setaf 2; tput bold; 
echo "Cosa vuoi fare?"
tput setaf 4; tput bold; 
echo "1. Firma un testo"
echo "2. Cifra un testo"
echo "3. Firma e Cifra un testo"
echo "4. Verifica una firma"
echo "5. Decifra un testo"
echo "6. Elenca le chiavi"
echo "7. Importa una chiave"
echo "8. Imposta fiducia in una chiave"
echo
tput sgr0 
read scelta
tput bel
clear

case $scelta in
1)
tput setaf 2; tput bold;
echo "Ricorda di terminare con invio e ctrl+d"
tput sgr0
gpg --clearsign -a -u $utente --cipher AES256 --digest-algo SHA512
;;

2)
tput setaf 2; tput bold;
echo "Ricorda di terminare con invio e ctrl+d"
tput sgr0
gpg -e -a -u $utente --cipher AES256 --digest-algo SHA512
;;

3)
tput setaf 2; tput bold;
echo "Ricorda di terminare con invio e ctrl+d"
tput sgr0
gpg --armor --sign --encrypt -u $utente --cipher AES256 --digest-algo SHA512
;;

4)
tput setaf 2; tput bold;
echo "Incolla il testo da verificare, premi invio e ctrl+d"
tput sgr0
gpg --verify
;;

5)
tput setaf 2; tput bold;
echo "Incolla il testo da decifrare, inserisci la password e se necessario ctrl+d"
tput sgr0 
gpg -d
;;

6)
gpg --list-keys
;;

7)
tput setaf 2; tput bold;
echo "Inserisci la chiave da importare e premi ctrl+d"
tput sgr0 
echo
gpg --import
;;

8)
clear
tput setaf 2; tput bold;
echo "Imposta la fiducia per quale chiave?"
tput setaf 5; tput bold;
echo "Ricorda di terminare con ctrl+d una volta finito (vedrai gpg>)"
tput sgr0 
echo
read fiducia
clear
gpg --edit-key $fiducia trust
;;

*)
clear
tput setaf 1; tput bold;
echo "Devi fare la tua scelta!"
;;
esac

echo
tput setaf 2; tput bold;
read -p "Premi invio per continuare o termina lo script con ctrl+c"
tput sgr0 
clear
tput bel
tput sgr0 
done
