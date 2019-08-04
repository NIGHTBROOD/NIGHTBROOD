-----------------------------------------
-- Spell: Stone III
-- Deals earth damage to an enemy.
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
    spellParams.V = 210
    spellParams.V0 = 200
    spellParams.V50 = 400
    spellParams.V100 = 550
    spellParams.V200 = 750
    spellParams.M = 1.5
    spellParams.M0 = 4
    spellParams.M50 = 3
    spellParams.M100 = 2
    spellParams.M200 = 1
    spellParams.I = 236

    if(caster:isPC()) then
        local JOB = caster:getMainJob()
        local TLVL = target:getMainLvl()
        if( (JOB == dsp.job.BLM and TLVL >=68) or
            (JOB == dsp.job.SCH and TLVL >=70) ) then
                spellParams.V = math.floor(spellParams.V * 0.8)
                spellParams.V0 = math.floor(spellParams.V0 * 0.8)
                spellParams.V50 = math.floor(spellParams.V50 * 0.8)
                spellParams.V100 = math.floor(spellParams.V100 * 0.8)
                spellParams.V200 = math.floor(spellParams.V200 * 0.8)
        end
    end
    
    return doElementalNuke(caster, spell, target, spellParams)
end
