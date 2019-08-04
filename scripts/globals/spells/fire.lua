-----------------------------------------
-- Spell: Fire
-- Deals fire damage to an enemy.
-----------------------------------------
require("scripts/globals/status")
require("scripts/globals/magic")
-----------------------------------------

function onMagicCastingCheck(caster, target, spell)
    return 0
end

function onSpellCast(caster, target, spell)
    local spellParams = {}
    spellParams.hasMultipleTargetReduction = false
    spellParams.resistBonus = 1.0
    spellParams.V = 35
    spellParams.V0 = 55
    spellParams.V50 = 125
    spellParams.V100 = 175
    spellParams.V200 = 175
    spellParams.M = 1
    spellParams.M0 = 1.4
    spellParams.M50 = 1
    spellParams.M100 = 0
    spellParams.M200 = 0
    spellParams.I = 46

    if(caster:isPC()) then
        local JOB = caster:getMainJob()
        local TLVL = target:getMainLvl()
        if( (JOB == dsp.job.BLM and TLVL >=38) or
            (JOB == dsp.job.DRK and TLVL >=60) or
            (JOB == dsp.job.RDM and TLVL >=50) or
            (JOB == dsp.job.SCH and TLVL >=42) ) then
                spellParams.V = math.floor(spellParams.V / 2)
                spellParams.V0 = math.floor(spellParams.V0 / 2)
                spellParams.V50 = math.floor(spellParams.V50 / 2)
                spellParams.V100 = math.floor(spellParams.V100 / 2)
                spellParams.V200 = math.floor(spellParams.V200 / 2)
        end
    end
    
    return doElementalNuke(caster, spell, target, spellParams)
end
