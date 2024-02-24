.nds
.thumb

.include "armips/include/battlescriptcmd.s"
.include "armips/include/abilities.s"
.include "armips/include/itemnums.s"
.include "armips/include/monnums.s"
.include "armips/include/movenums.s"

.create "build/move/battle_sub_seq/1_357", 0

// Chilly Reception
// Hail + Teleport effect when in trainer battle.

a001_354:
    if IF_MASK, VAR_MOVE_STATUS, 0x10001, _Failed
_Move:
    printmessage 1412, TAG_NICK, BATTLER_ATTACKER, "NaN", "NaN", "NaN", "NaN", "NaN"
    // {STRVAR_1 1, 0, 0} is preparing to tell\na chillingly bad joke!
    waitmessage
    wait 0x1E
    printattackmessage
    waitmessage
    playanimation BATTLER_ATTACKER
    waitmessage

    if IF_MASK, VAR_FIELD_EFFECT, 0x40, _Switch
    printmessage 0x32A, 0x0, "NaN", "NaN", "NaN", "NaN", "NaN", "NaN"
    // It started to snow!
    waitmessage
    wait 0x1E
    changevar VAR_OP_CLEARMASK, VAR_FIELD_EFFECT, 0x80FF // taken from hail battle effect 
    changevar VAR_OP_SETMASK, VAR_FIELD_EFFECT, 0x40
    changevar VAR_OP_SET, VAR_WEATHER_TURNS, 0x5
    changevar VAR_OP_SET, VAR_ADD_STATUS2, 0x2000005D
    checkitemeffect 0x1, BATTLER_ATTACKER, 0x6E, _Switch
    getitempower BATTLER_ATTACKER, 0x9
    changevar2 VAR_OP_ADD, VAR_WEATHER_TURNS, VAR_CALCULATION_WORK

_Switch:
    tryswitchinmon BATTLER_ATTACKER, 0x1, _Failed
    gotosubscript 76
    printmessage 0x42B, 0x12, 0x6, 0x6, "NaN", "NaN", "NaN", "NaN"
    // {STRVAR_1 1, 0, 0} went back\nto {STRVAR_1 3, 1, 0}!
    trynaturalcure BATTLER_ATTACKER, _0038
    changemondatabyvalue VAR_OP_SET, BATTLER_ATTACKER, 0x34, 0x0
_0038:
    deletepokemon BATTLER_ATTACKER
    waitmessage
    preparehpgaugeslide BATTLER_ATTACKER
    waitmessage
    changevar VAR_OP_SETMASK, VAR_SERVER_STATUS2, 0x10
    changevar VAR_OP_CLEARMASK, VAR_SERVER_STATUS2, 0x80
    changevar VAR_OP_SET, VAR_ATTACKER_STATUS, 0x0
    jumptosubseq 10
_Failed:
    changevar VAR_OP_SETMASK, VAR_MOVE_STATUS, 0x40
    endscript

.close
