#!/bin/bash
echo "Cliente HMPT"

echo "(1)SEND - Enviando el Hansake"

echo "GREEN_POWA 127.0.0.1" | nc localhost 4242

echo "(2)LISTEN - Escuchando confirmacion"

MSG=`nc -l 4242`

echo $MSG

if [ "$MSG" != "OK_HMPT" ]
then 
	echo "ERROR 1: Handshake mal formado"
	exit
fi

echo "Seguimos activos"
