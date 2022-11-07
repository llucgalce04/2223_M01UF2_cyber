#!/bin/bash
echo "Servidor HMTP"
echo "(0) LISTEN - Levantando el servidor"

MSG=`nc -l 4242`

HANDSHAKE=`echo $MSG | cut -d " " -f 1`
IP_CLIENT=`echo $MSG | cut -d " " -f 2`

echo "(3)SEND - Confirmacion Handshake"

if [ "$HANDSHAKE" != "GREEN_POWA" ]
then
	echo "KO_HMPT" | nc $IP_CLIENT 4242
	exit 1
fi

echo "OK_HMPT" | nc $IP_CLIENT 4242

echo "(4)LISTEN"

MSG=`nc -l 4242`

exit 0
