randombeats
===========

About
-----

Last week I found [beats](http://beatsdrummachine.com/) from
[jstrait](https://github.com/jstrait/beats/). I was just smashed around about the idea of
an commandline music generator tool. 

The bad part of the story: I am the most uncreative dude alive. These
phrase made me thinking... 

If this is true, it is probably possible that a randomized script makes better 
music than me. 


<img
src="https://github.com/noqqe/randombeats/raw/master/challenge-accepted.png">


Usage
-----

Copy randombeats.bash to your music directory, execute the script and make the
txt file with beats. It just generates a yaml file for beats :)

    git clone http://github.com/noqqe/randombeats
    cp randombeats/randombeats.bash /path/to/music
    ./randombeats.bash > randomsong.txt
    beats randomsong.txt
    open randomsong.wav

And for your own fun do: 

     ./randombeats.bash > rnd.txt && beats rnd.txt && open rnd.wav 

Technical
---------

* Sometimes its a little bit to fast... for now i havent found the optimal speed
range for generating good music

