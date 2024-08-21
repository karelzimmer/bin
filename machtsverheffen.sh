#!/usr/bin/env bash 
###############################################################################
# SPDX-FileComment: Machtsverheffen, bereken 5^4 zonder machtsverheffen
#
# NOVI: Datastructuren en Algoritmen: Dynamic Programming en Recursion
# Dit is geen recursie, maar iteratie :-( !
#
# SPDX-FileCopyrightText: Karel Zimmer <info@karelzimmer.nl>
# SPDX-License-Identifier: CC0-1.0
###############################################################################

GRONDTAL=5
EXPONENT=4
RESULT=1

macht () 
{
    result=$((result * GRONDTAL))
}

for i in $(seq 1 $EXPONENT); do
# for (( i=0; i<$EXPONENT; i++ )); do
    echo "5^$i"
    macht
done 

echo "$RESULT"
exit 0
