.nds
.thumb

.include "armips/include/battlescriptcmd.s"
.include "armips/include/abilities.s"
.include "armips/include/itemnums.s"
.include "armips/include/monnums.s"
.include "armips/include/movenums.s"

.create "build/move/battle_eff_seq/0_065", 0

a030_065:
    if IF_EQUAL, VAR_CURRENT_MOVE, MOVE_AURORA_VEIL, _AuroraVeil
    changevar VAR_OP_SET, VAR_ADD_STATUS1, 0x20000044
    endscript
_AuroraVeil:
    changevar VAR_OP_SET, VAR_ADD_STATUS1, ADD_STATUS_AURORA_VEIL | ADD_STATUS_WORK
    endscript

.close
