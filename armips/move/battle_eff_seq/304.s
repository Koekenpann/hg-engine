.nds
.thumb

.include "armips/include/battlescriptcmd.s"
.include "armips/include/abilities.s"
.include "armips/include/itemnums.s"
.include "armips/include/monnums.s"
.include "armips/include/movenums.s"

.create "build/move/battle_eff_seq/0_304", 0

// Surging Strikes move effect

a030_304:
    setmultihit 0x3, 0xFD
    changevar VAR_OP_SET, VAR_SUCCESSIVE_HIT, 0x1
    changevar VAR_OP_SET, VAR_WAS_MOVE_CRITICAL, 0x2
    damagecalc
    endscript

.close