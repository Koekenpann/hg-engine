.nds
.thumb

.include "armips/include/animscriptcmd.s"
.include "armips/include/abilities.s"
.include "armips/include/itemnums.s"
.include "armips/include/monnums.s"
.include "armips/include/movenums.s"

.create "build/move/move_anim/0_869", 0

// mortal spin test

a010_869:
    loadparticlefromspa 0, 247 //rapid spin
    waitparticle
    loadparticlefromspa 1, 149 //sludge
    waitparticle

    addparticle 0, 1, 3 //spinning
    addparticle 0, 2, 3 //spinning
    //addparticle 0, 0, 4 //hits the target
    playsepan 1883, -117 //spin sound i hope
    wait 10

    playsepan 2060, 117  //sludge hit sound i hope 
    waitse 1979, 117, 12 //sludge hit sound i hope
    waitse 1979, 117, 15 //sludge hit sound i hope 
    addparticle 1, 0, 4  //sludge hit
    callfunction 34, 6, 8, 0, 1, 31764, 10, 0, "NaN", "NaN", "NaN", "NaN" // change to purple
    waitparticle

    unloadparticle 0
    unloadparticle 1
    waitstate
    end
    

.close
