-----------------------------------------
-- Spell: Water II
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
    spellParams.V = 95
    spellParams.V0 = 120
    spellParams.V50 = 260
    spellParams.V100 = 355
    spellParams.V200 = 455
    spellParams.M = 1
    spellParams.M0 = 2.8
    spellParams.M50 = 1.9
    spellParams.M100 = 1
    spellParams.M200 = 0
    spellParams.I = 113

    if(caster:isPC()) then
        local JOB = caster:getMainJob()
        local TLVL = target:getMainLvl()
        if( (JOB == dsp.job.BLM and TLVL >=55) or
            (JOB == dsp.job.RDM and TLVL >=67) or
            (JOB == dsp.job.SCH and TLVL >=57) ) then
                spellParams.V = math.floor(spellParams.V / 2)
                spellParams.V0 = math.floor(spellParams.V0 / 2)
                spellParams.V50 = math.floor(spellParams.V50 / 2)
                spellParams.V100 = math.floor(spellParams.V100 / 2)
                spellParams.V200 = math.floor(spellParams.V200 / 2)
        end
    end
    
    return doElementalNuke(caster, spell, target, spellParams)
end
