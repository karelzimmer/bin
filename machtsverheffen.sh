#!/usr/bin/bash 
###############################################################################
# SPDX-FileComment: Machtsverheffen, bereken 5^4 zonder machtsverheffen
#
# NOVI: Datastructuren en Algoritmen: Dynamic Programming en Recursion
# Dit is geen recursie, maar iteratie :-( !
#
# SPDX-FileCopyrightText: Karel Zimmer <info@karelzimmer.nl>
# SPDX-License-Identifier: CC0-1.0
###############################################################################

grondtal=5
exponent=4
result=1

macht () 
{
    result=$((result * grondtal))
}

for i in $(seq 1 $exponent); do
# for (( i=0; i<$exponent; i++ )); do
    echo "5^$i"
    macht
done 

echo "$result"
exit 0
