#!/usr/bin/env bash

#+--------------------------------------------------+
#| Use OpenSSL and cURL to do SSL certificate stuff |
#+--------------------------------------------------+

# COLORS
GREEN="\e[1;32m";
RESET="\e[0m";

# Global variables
CONTINUE=1

# Banner
clear
cat << \EOF
  +------------------------------+
  |                              |
  |           EASY SSL           |
  |                              |
  | Author: Naum Ivanovski       |
  +------------------------------+
EOF

# Create Menu from which to select
Menu (){
    echo ""
    echo "Choose from the options: "
    echo ""
    echo "====== LOCAL OPERATIONS ======"
    echo "   1) Read SSL Certificate. (CRT,CER)"
    echo "   2) Create Self-Sign Certificate."
    echo "   3) Create CSR."
    echo "   4) Sign CSR."
    echo "   5) Read PFX file. (PKCS12)"
    echo "   6) Extract Certificate Chain from PFX file. (PKCS12)"
    echo "   7) Extract Private Key from PFX file. (PKCS12)"
    echo "   8) Remove Passphrase from Private Key."
    echo ""
    echo "====== REMOTE OPERATIONS ======"
    echo "   9) Check server SSL Certificate vaildity."
    echo "   10) Get Certificate chain from site. (PEM)"
    echo ""
    echo "   q) Quit."
    echo ""
    read -p "Your Option: " OPTION;
    case $OPTION in
        1) ReadSSL ;;
        2) CreateCA ;;
        3) CreateCSR ;;
        4) SignCSR ;;
        5) ReadPFX ;;
        6) ExtractChainFromPFX ;;
        7) ExtractPrivateKeyFromPFX ;;
        8) RemovePrivateKeyPassphrase ;;
        9) SSLValidity ;;
        10) GetChain ;;
        q) CONTINUE=0 ;;
        *) clear ;;
    esac
}

ReadSSL (){
    read -p "Certificate file (.crt/.cer): " CRT;
    openssl x509 -noout -text -in $CRT
}

CreateCA (){
    read -p "Enter name: " NAME;
    read -p "Enter key algoritham (ALGO:BITS): " ALGO;
    read -p "Enter certificate vailidity days: " DAYS;
    openssl req -nodes -newkey $ALGO -keyout $NAME.key -out $NAME.crt -x509 -days $DAYS
}

CreateCSR (){
    read -p "Enter name: " NAME;
    read -p "Enter key algoritham (ALGO:BITS): " ALGO;
    openssl req -nodes -newkey $ALGO -keyout $NAME.key -out $NAME.csr
}

SignCSR (){
    read -p "Enter signing certificate (.crt): " SCRT;
    read -p "Enter signing certificate key (.key): " SKEY;
    read -p "Enter CSR (.csr): " CSR;
    read -p "Enter certificate vailidity days: " DAYS;
    read -p "Output file (.crt):" OCRT;
    openssl x509 -req -in $CSR -days $DAYS -CA $SCRT -CAkey $SKEY -out $OCRT
}

ReadPFX (){
    read -p "Enter file (.pfx): " INFILE;
    openssl pkcs12 -info -in $INFILE -nodes
}

ExtractChainFromPFX (){
    read -p "Enter file (.pfx): " INFILE;
    read -p "Enter output file (.pem): " OFILE;
    openssl pkcs12 -in $INFILE -nokeys -out $OFILE -nodes
}

ExtractPrivateKeyFromPFX () {
    read -p "Enter file (.pfx): " INFILE;
    read -p "Enter output file (.key): " OFILE;
    openssl pkcs12 -in $INFILE -nocerts -out $OFILE -nodes
}

RemovePrivateKeyPassphrase () {
    read -p "Enter file (.key): " INFILE;
    read -p "Enter output file (.key): " OFILE;
    openssl rsa -in $INFILE -out $OFILE
}

SSLValidity (){
    read -p "Enter site name: " SITE;
    curl -kvI https://$SITE 2>&1 | awk '/Server certificate/,/issuer/ { print "\t"$0 }'
}

GetChain (){
    read -p "Enter site name: " SITE;
    read -p "Use SNI [Y/N] (Default: N): " SNI;
    if [ $SNI = "Y" ];
    then
        echo | openssl s_client -showcerts -servername $SITE -connect $SITE:443 | awk '/BEGIN CERT/,/END CERT/ {print $0}' > $SITE.pem
    else
        echo | openssl s_client -showcerts -connect $SITE:443 | awk '/BEGIN CERT/,/END CERT/ {print $0}' > $SITE.pem
    fi
    echo -e "\n[${GREEN}+${RESET}] PEM file ${SITE}.pem created."
}

# START MENU
while [ $CONTINUE ]
do
    Menu
    if [ $CONTINUE -eq 0 ];then
        echo "Goodbye.";
        break;
    fi
done

exit