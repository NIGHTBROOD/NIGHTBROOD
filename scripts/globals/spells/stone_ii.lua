-----------------------------------------
-- Spell: Stone II
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
    spellParams.V = 78
    spellParams.V0 = 100
    spellParams.V50 = 250
    spellParams.V100 = 350
    spellParams.V200 = 450
    spellParams.M = 1
    spellParams.M0 = 3
    spellParams.M50 = 2
    spellParams.M100 = 1
    spellParams.M200 = 1
    spellParams.I = 95

    if(caster:isPC()) then
        local JOB = caster:getMainJob()
        local TLVL = target:getMainLvl()
        if( (JOB == dsp.job.BLM and TLVL >=51) or
            (JOB == dsp.job.RDM and TLVL >=65) or
            (JOB == dsp.job.SCH and TLVL >=54) ) then
                spellParams.V = math.floor(spellParams.V / 2)
                spellParams.V0 = math.floor(spellParams.V0 / 2)
                spellParams.V50 = math.floor(spellParams.V50 / 2)
                spellParams.V100 = math.floor(spellParams.V100 / 2)
                spellParams.V200 = math.floor(spellParams.V200 / 2)
        end
    end
    
    return doElementalNuke(caster, spell, target, spellParams)
end
