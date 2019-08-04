-----------------------------------------
-- Spell: Blizzard II
-- Deals ice damage to an enemy.
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
    spellParams.V = 155
    spellParams.V0 = 180
    spellParams.V50 = 290
    spellParams.V100 = 370
    spellParams.V200 = 470
    spellParams.M = 1
    spellParams.M0 = 2.2
    spellParams.M50 = 1.6
    spellParams.M100 = 1
    spellParams.M200 = 0
    spellParams.I = 178

    if(caster:isPC()) then
        local JOB = caster:getMainJob()
        local TLVL = target:getMainLvl()
        if( (JOB == dsp.job.BLM and TLVL >=64) or
            (JOB == dsp.job.RDM and TLVL >=73) or
            (JOB == dsp.job.SCH and TLVL >=66) ) then
                spellParams.V = math.floor(spellParams.V / 2)
                spellParams.V0 = math.floor(spellParams.V0 / 2)
                spellParams.V50 = math.floor(spellParams.V50 / 2)
                spellParams.V100 = math.floor(spellParams.V100 / 2)
                spellParams.V200 = math.floor(spellParams.V200 / 2)
        end
    end
    
    return doElementalNuke(caster, spell, target, spellParams)
end
