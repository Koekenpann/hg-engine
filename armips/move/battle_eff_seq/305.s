.nds
.thumb

.include "armips/include/battlescriptcmd.s"
.include "armips/include/abilities.s"
.include "armips/include/itemnums.s"
.include "armips/include/monnums.s"
.include "armips/include/movenums.s"

.create "build/move/battle_eff_seq/0_305", 0

// Electro Shot battleeffect 

a030_305:
    checkcloudnine _ChargeTurn
    if IF_MASK, VAR_FIELD_EFFECT, 0x03, _Rain // 0x03 is Temp Rain or Perm Rain 
_ChargeTurn:
    ifmonstat IF_MASK, BATTLER_ATTACKER, MON_DATA_STATUS_2, 0x1000, _Attack
    checkitemeffect 0x0, BATTLER_ATTACKER, 0x63, _HandlePowerHerb // Power Herb 
    changevar VAR_OP_SET, VAR_ADD_STATUS1, 0x4000000C
    changevar VAR_OP_SET, VAR_ADD_STATUS2, 0x40000012
    changevar VAR_OP_SETMASK, VAR_SERVER_STATUS1, 0x23
    endscript
_HandlePowerHerb:
    gotosubscript 356 // make new one that handles spatk boost
_Continue:
    if IF_EQUAL, VAR_DEFENDER, 0xFF, _Reset
_Attack:
    critcalc
    damagecalc
_Reset:
    gotosubscript 259 // Reset charge turn
    endscript

_Rain:
    printpreparedmessage
    waitmessage
    changevar VAR_OP_SET, VAR_ADD_STATUS1, 0x40000012
    goto _Continue

.close
