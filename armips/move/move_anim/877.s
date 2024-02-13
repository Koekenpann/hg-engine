.nds
.thumb

.include "armips/include/animscriptcmd.s"
.include "armips/include/abilities.s"
.include "armips/include/itemnums.s"
.include "armips/include/monnums.s"
.include "armips/include/movenums.s"

.create "build/move/move_anim/0_877", 0

a010_877:
    loadparticlefromspa 0, 37
    waitparticle
    loadparticlefromspa 1, 286
    waitparticle

    // "charge up" animation + pay day hit anim on self
    callfunction 33, 5, 0, 1, 0, 12, 0, "NaN", "NaN", "NaN", "NaN", "NaN"
    waitstate
    addparticle 1, 0, 3
    addparticle 1, 1, 3
    addparticle 1, 2, 3
    wait 77
    callfunction 33, 5, 0, 1, 12, 0, 0, "NaN", "NaN", "NaN", "NaN", "NaN"
    callfunction 42, 8, 258, 100, 110, 100, 80, 100, 327681, 327685, "NaN", "NaN"
    playsepan 1925, -117
    waitstate
    callfunction 42, 8, 258, 100, 100, 100, 120, 100, 1, 327685, "NaN", "NaN"
    addparticle 0, 1, 3
    wait 20

    addparticle 0, 0, 17
    cmd37 6, 0, 2, 6, 1, 0, 0, "NaN", "NaN"
    playsepanmod 1911, -117, 117, 4, 2
    wait 10
    addparticle 0, 1, 4
    addparticle 0, 3, 4
    callfunction 36, 5, 1, 0, 1, 2, 264, "NaN", "NaN", "NaN", "NaN", "NaN"
    playsepan 1906, 117
    waitparticle
    unloadparticle 0
    end
    

.close
