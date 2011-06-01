#!/bin/bash
# Copyright: (C) 2011 Florian Baumann <flo@noqqe.de>
# License: GPL-3 <http://www.gnu.org/licenses/gpl-3.0.txt>
# Date: Tuesday 2011-05-19


### Configuration
# Speed of the Song 
MAXTEMPO=100
MINTEMPO=50

# Lines in Flow 
MAXLINES=6
MINLINES=2

# Sounds which are used for Song
MAXSOUNDS=8
MINSOUNDS=3

# X'ses in Song line (1-20)
# 1 = very much X'ses ( X.XXXX.XX..XXX.. )
# 20 = not much X'ses ( X...…........ ) 
SALTX=8

### Functions 
# Generate header and tempo
function song () {
    
    RNDTEMPO=$((RANDOM % $MAXTEMPO + $MINTEMPO))

    echo "Song:"
    echo "  Tempo: $RNDTEMPO"
    echo "  Flow:"
}

# Generate flow and decide how much lines
# are used
function flow () {

    local COUNT=1
    RNDLINES=$((RANDOM % $MAXLINES + $MINLINES))

    while [ $COUNT -le $RNDLINES ]; do 
        
        if [ $((RANDOM % 2)) -ne 0 ]; then 
            echo "    - LINE$COUNT: x8"
        else
            echo "    - LINE$COUNT: x4"
        fi
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
        
        if [ $((RANDOM % $SALTX)) -ne 0 ]; then 
            echo -n "."
        else 
            echo -n "X"
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
       

        # Randomize double size for this line
        if [ $((RANDOM % 2)) -ne 0 ]; then 
            DOUBLESIZE=1
        else    
            DOUBLESIZE=0
        fi

        # Randomize number of used sounds
        RNDSOUND=$((RANDOM % $MAXSOUNDS + $MINSOUNDS ))
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

### Execute  
song
flow
lines
