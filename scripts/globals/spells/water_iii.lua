-----------------------------------------
-- Spell: Water III
-- Deals water damage to an enemy.
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
    spellParams.V = 236
    spellParams.V0 = 230
    spellParams.V50 = 415
    spellParams.V100 = 560
    spellParams.V200 = 755
    spellParams.M = 1.5
    spellParams.M0 = 3.7
    spellParams.M50 = 2.9
    spellParams.M100 = 1.95
    spellParams.M200 = 1
    spellParams.I = 265

    if(caster:isPC()) then
        local JOB = caster:getMainJob()
        local TLVL = target:getMainLvl()
        if( (JOB == dsp.job.BLM and TLVL >=70) or
            (JOB == dsp.job.SCH and TLVL >=71) ) then
                spellParams.V = math.floor(spellParams.V * 0.8)
                spellParams.V0 = math.floor(spellParams.V0 * 0.8)
                spellParams.V50 = math.floor(spellParams.V50 * 0.8)
                spellParams.V100 = math.floor(spellParams.V100 * 0.8)
                spellParams.V200 = math.floor(spellParams.V200 * 0.8)
        end
    end
    
    return doElementalNuke(caster, spell, target, spellParams)
end
