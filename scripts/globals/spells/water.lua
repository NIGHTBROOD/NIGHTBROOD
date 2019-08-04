-----------------------------------------
-- Spell: Water
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
    spellParams.V = 16
    spellParams.V0 = 25
    spellParams.V50 = 115
    spellParams.V100 = 165
    spellParams.V200 = 165
    spellParams.M = 1
    spellParams.M0 = 1.8
    spellParams.M50 = 1
    spellParams.M100 = 0
    spellParams.M200 = 0
    spellParams.I = 25

    if(caster:isPC()) then
        local JOB = caster:getMainJob()
        local TLVL = target:getMainLvl()
        if( (JOB == dsp.job.BLM and TLVL >=30) or
            (JOB == dsp.job.DRK and TLVL >=48) or
            (JOB == dsp.job.RDM and TLVL >=40) or
            (JOB == dsp.job.SCH and TLVL >=34) ) then
                spellParams.V = math.floor(spellParams.V / 2)
                spellParams.V0 = math.floor(spellParams.V0 / 2)
                spellParams.V50 = math.floor(spellParams.V50 / 2)
                spellParams.V100 = math.floor(spellParams.V100 / 2)
                spellParams.V200 = math.floor(spellParams.V200 / 2)
        end
    end
    
    return doElementalNuke(caster, spell, target, spellParams)
end
