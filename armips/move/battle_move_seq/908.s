.nds
.thumb

.include "armips/include/battlescriptcmd.s"
.include "armips/include/abilities.s"
.include "armips/include/itemnums.s"
.include "armips/include/monnums.s"
.include "armips/include/movenums.s"

.create "build/move/battle_move_seq/0_908", 0

a000_908:
    preparemessage 1421, 0x2, 0x1, "NaN", "NaN", "NaN", "NaN", "NaN" // {STRVAR_1 1, 0, 0} absorbed\nelectricity!
    jumptocurmoveeffectscript

.close
