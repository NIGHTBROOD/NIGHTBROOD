-----------------------------------------
-- Spell: Fire III
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
    spellParams.V = 295
    spellParams.V0 = 290
    spellParams.V50 = 445
    spellParams.V100 = 580
    spellParams.V200 = 765
    spellParams.M = 1.5
    spellParams.M0 = 3.1
    spellParams.M50 = 2.7
    spellParams.M100 = 1.85
    spellParams.M200 = 1
    spellParams.I = 320

    if(caster:isPC()) then
        local JOB = caster:getMainJob()
        local TLVL = target:getMainLvl()
        if( (JOB == dsp.job.BLM and TLVL >=73) or
            (JOB == dsp.job.SCH and TLVL >=73) ) then
                spellParams.V = math.floor(spellParams.V * 0.8)
                spellParams.V0 = math.floor(spellParams.V0 * 0.8)
                spellParams.V50 = math.floor(spellParams.V50 * 0.8)
                spellParams.V100 = math.floor(spellParams.V100 * 0.8)
                spellParams.V200 = math.floor(spellParams.V200 * 0.8)
        end
    end
    
    return doElementalNuke(caster, spell, target, spellParams)
end
