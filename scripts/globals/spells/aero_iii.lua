-----------------------------------------
-- Spell: Aero III
-- Deals wind damage to an enemy.
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
    spellParams.V = 265
    spellParams.V0 = 260
    spellParams.V50 = 430
    spellParams.V100 = 570
    spellParams.V200 = 760
    spellParams.M = 1.5
    spellParams.M0 = 3.4
    spellParams.M50 = 2.8
    spellParams.M100 = 1.9
    spellParams.M200 = 1
    spellParams.I = 295

    if(caster:isPC()) then
        local JOB = caster:getMainJob()
        local TLVL = target:getMainLvl()
        if( (JOB == dsp.job.BLM and TLVL >=72) or
            (JOB == dsp.job.SCH and TLVL >=72) ) then
                spellParams.V = math.floor(spellParams.V * 0.8)
                spellParams.V0 = math.floor(spellParams.V0 * 0.8)
                spellParams.V50 = math.floor(spellParams.V50 * 0.8)
                spellParams.V100 = math.floor(spellParams.V100 * 0.8)
                spellParams.V200 = math.floor(spellParams.V200 * 0.8)
        end
    end
    
    return doElementalNuke(caster, spell, target, spellParams)
end
