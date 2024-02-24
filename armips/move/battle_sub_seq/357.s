.nds
.thumb

.include "armips/include/battlescriptcmd.s"
.include "armips/include/abilities.s"
.include "armips/include/itemnums.s"
.include "armips/include/monnums.s"
.include "armips/include/movenums.s"

.create "build/move/battle_sub_seq/1_357", 0

// Aurora Veil as Reflect + Light Screen
// Shoutout Drayano60 for his implementation

a001_353:
    checkcloudnine _Failed
    if IF_NOTMASK, VAR_FIELD_EFFECT, 0xC0, _Failed // Checks for Hail & no Cloud Nine ability 
_Reflect:
    setreflect _LightScreen 
    gotosubscript 53
_LightScreen:
    setlightscreen _End 
    gotosubscript 53
_End:
    endscript
_Failed:
    changevar VAR_OP_SETMASK, VAR_MOVE_STATUS, 0x40
    endscript

.close
