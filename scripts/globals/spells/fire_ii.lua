-----------------------------------------
-- Spell: Fire II
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
    spellParams.V = 133
    spellParams.V0 = 160
    spellParams.V50 = 280
    spellParams.V100 = 365
    spellParams.V200 = 465
    spellParams.M = 1
    spellParams.M0 = 2.4
    spellParams.M50 = 1.7
    spellParams.M100 = 1
    spellParams.M200 = 0
    spellParams.I = 155

    if(caster:isPC()) then
        local JOB = caster:getMainJob()
        local TLVL = target:getMainLvl()
        if( (JOB == dsp.job.BLM and TLVL >=62) or
            (JOB == dsp.job.RDM and TLVL >=71) or
            (JOB == dsp.job.SCH and TLVL >=63) ) then
                spellParams.V = math.floor(spellParams.V / 2)
                spellParams.V0 = math.floor(spellParams.V0 / 2)
                spellParams.V50 = math.floor(spellParams.V50 / 2)
                spellParams.V100 = math.floor(spellParams.V100 / 2)
                spellParams.V200 = math.floor(spellParams.V200 / 2)
        end
    end
    
    return doElementalNuke(caster, spell, target, spellParams)
end
