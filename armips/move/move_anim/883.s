.nds
.thumb

.include "armips/include/animscriptcmd.s"
.include "armips/include/abilities.s"
.include "armips/include/itemnums.s"
.include "armips/include/monnums.s"
.include "armips/include/movenums.s"

.create "build/move/move_anim/0_883", 0

// Shed Tail
// Acid Armor + Slam/Poison Tail/Iron Tail on self

a010_883:
    cmd1F 0x0, 0
    loadparticlefromspa 0, 173  // Acid Armor
    waitparticle
    loadparticlefromspa 1, 360  // Poison Tail 
    waitparticle

    callfunction 12, 0, "NaN", "NaN", "NaN", "NaN", "NaN", "NaN", "NaN", "NaN", "NaN", "NaN" // Acid Armor animation
    playsepan 1856, -117
    waitstate
    cmd20 0

    playsepan 2124, 117
    addparticle 1, 2, 3
    end
    

.close
