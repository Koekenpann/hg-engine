.nds
.thumb

.include "armips/include/battlescriptcmd.s"
.include "armips/include/abilities.s"
.include "armips/include/itemnums.s"
.include "armips/include/monnums.s"
.include "armips/include/movenums.s"
.include "armips/include/constants.s"

.create "build/move/battle_eff_seq/0_300", 0

// Psyblade + Rising Voltage
a030_300:
    ifterrainoverlayistype ELECTRIC_TERRAIN, IncreaseBasePower
    goto Continue
IncreaseBasePower:
    if IF_EQUAL, VAR_CURRENT_MOVE, MOVE_PSYBLADE, _PsyBladeBoost // If not true it is Rising Voltage 
    changevar VAR_OP_ADD, VAR_ABILITY_TEMP, 70 // If the target is on Electric Terrain, its base power is doubled to 140. (70->140)
    goto Continue
_PsyBladeBoost:
    changevar VAR_OP_ADD, VAR_ABILITY_TEMP, 40 // If the user is on Electric Terrain, its base power is increased to 120. (80->120)
Continue:
    critcalc
    damagecalc
    endscript

.close
