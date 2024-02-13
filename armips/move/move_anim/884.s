.nds
.thumb

.include "armips/include/animscriptcmd.s"
.include "armips/include/abilities.s"
.include "armips/include/itemnums.s"
.include "armips/include/monnums.s"
.include "armips/include/movenums.s"

.create "build/move/move_anim/0_884", 0

a010_884:
    loadparticlefromspa 0, 90 // Blizzard
    waitparticle
    loadparticlefromspa 1, 276 // Hail
    waitparticle

    // Turn attacking mon black + Blizzard wind
    shadeattackingmon 0, 0, 0
    playsepan 2121, 0 // Blizzard sound
    addparticle 0, 3, 0
    wait 4
    playsepan 1853, 117
    wait 27
    waitparticle
    unloadparticle 0
    stopse 2121
    waitstate

    // Summon hail 
    callfunction 33, 5, 0, 1, 0, 12, 0, "NaN", "NaN", "NaN", "NaN", "NaN"
    waitstate
    repeatse 2052, 0, 3, 9
    addparticle 1, 1, 4
    addparticle 1, 2, 4
    addparticle 1, 0, 4
    waitparticle
    unloadparticle 1
    callfunction 33, 5, 0, 1, 12, 0, 0, "NaN", "NaN", "NaN", "NaN", "NaN"
    waitstate
    end
    

.close
