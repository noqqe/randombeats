#!/bin/bash
# Copyright: (C) 2011 Florian Baumann <flo@noqqe.de>
# License: GPL-3 <http://www.gnu.org/licenses/gpl-3.0.txt>
# Date: Tuesday 2011-05-19

# Generate header and tempo
function song () {
    
    RNDTEMPO=$((RANDOM % 100 + 100))

    echo "Song:"
    echo "  Tempo: $RNDTEMPO"
    echo "  Flow:"
}

# Generate flow and decide how much lines
# are used
function flow () {

    local COUNT=1
    RNDLINES=$((RANDOM % 4 + 1))

    while [ $COUNT -le $RNDLINES ]; do 
        echo "    - LINE$COUNT: x4"
        ((COUNT++))
    done
    echo
}

# choose a random wav from your directory
function randomwav () {
    WAVS=(*.wav)
    N=${#WAVS[@]}
    N=$((RANDOM % N))
    RNDWAV=${WAVS[$N]}
    echo $RNDWAV
}

# generate a randomized line of X and . 
function rndchar () {
    local SIZE=16
    local COUNT=1
    local SIGN1="X"
    local SIGN0="."
    while [ $COUNT -le $SIZE ]; do
        
        if [ $((RANDOM % 2)) -ne 0 ]; then 
            echo -n "X"
        else 
            echo -n "."
        fi
    ((COUNT++))
    done
}
         
# Gernerate all defined lines with randomized
# lines and stuff
function lines () {

    local LCOUNT=1
    while [ $LCOUNT -le $RNDLINES ]; do
        echo "LINE$LCOUNT: "
       

        if [ $((RANDOM % 2)) -ne 0 ]; then 
            DOUBLESIZE=1
        else    
            DOUBLESIZE=0
        fi

        RNDSOUND=$((RANDOM % 5 + 1 ))
        local SCOUNT=1
        while [ $SCOUNT -le $RNDSOUND ]; do

            if [ $DOUBLESIZE -ne 0 ]; then
                echo -e "    - $(randomwav): $(rndchar)|$(rndchar)"
                ((SCOUNT++))
            else
                echo -e "    - $(randomwav): $(rndchar)"
                ((SCOUNT++))
            fi 
        done
        
        ((LCOUNT++))
        echo ""
    done
}

# start fun :P 
song
flow
lines
