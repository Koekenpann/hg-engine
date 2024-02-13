.nds
.thumb

.include "armips/include/battlescriptcmd.s"
.include "armips/include/abilities.s"
.include "armips/include/itemnums.s"
.include "armips/include/monnums.s"
.include "armips/include/movenums.s"

.create "build/move/battle_sub_seq/1_048", 0

a001_048:
    changemondatabyvar VAR_OP_GET_RESULT, BATTLER_ATTACKER, 0x2B, VAR_CALCULATION_WORK
    changevar VAR_OP_MUL, VAR_CALCULATION_WORK, 0x5
    checkonsameteam BATTLER_ATTACKER, BATTLER_OPPONENT, _0044
    changevar2 VAR_OP_ADD, VAR_MONEY, VAR_CALCULATION_WORK
_0044:
    printmessage 0x332, 0x0, "NaN", "NaN", "NaN", "NaN", "NaN", "NaN" // Coins were scattered everywhere!
    waitmessage
    wait 0x1E
    if IF_EQUAL, VAR_CURRENT_MOVE, MOVE_MAKE_IT_RAIN, _SpAtkDrop
    endscript
_SpAtkDrop:
    changevar2 VAR_OP_SET, VAR_ACTIVE_BATTLER, VAR_ATTACKER
    changevar VAR_OP_SETMASK, VAR_SERVER_STATUS2, 0x80
    changevar VAR_OP_SET, VAR_ADD_EFFECT_ATTRIBUTE, SPATK_DOWN
    gotosubscript 12
    changevar VAR_OP_CLEARMASK, VAR_SERVER_STATUS2, 0x2
    changevar VAR_OP_CLEARMASK, VAR_SERVER_STATUS2, 0x80
    endscript

.close
