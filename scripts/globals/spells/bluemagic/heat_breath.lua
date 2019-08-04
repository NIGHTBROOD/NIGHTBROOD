-----------------------------------------
-- Spell: Heat Breath
-- Deals fire damage to enemies within a fan-shaped area originating from the caster
-- Spell cost: 169 MP
-- Monster Type: Beasts
-- Spell Type: Magical (Fire)
-- Blue Magic Points: 4
-- Stat Bonus: STR+3
-- Level: 71
-- Casting Time: 7.5 seconds
-- Recast Time: 49 seconds
-- Magic Bursts on: Liquefaction, Fusion, Light
-- Combos: Magic Attack Bonus
-----------------------------------------
require("scripts/globals/bluemagic")
require("scripts/globals/status")
require("scripts/globals/magic")
-----------------------------------------

function onMagicCastingCheck(caster,target,spell)
    return 0
end

function onSpellCast(caster,target,spell)
    local params = {}
        params.diff = caster:getStat(dsp.mod.INT) - target:getStat(dsp.mod.INT)
        params.attribute = dsp.mod.INT
        params.skillType = dsp.skill.BLUE_MAGIC
        params.bonus = 1.0
        -- This data should match information on http://wiki.ffxiclopedia.org/wiki/Calculating_Blue_Magic_Damage
        params.multiplier = multi
        params.tMultiplier = 1.5
        params.duppercap = 69
        params.str_wsc = 0.0
        params.dex_wsc = 0.0
        params.vit_wsc = 0.0
        params.agi_wsc = 0.0
        params.int_wsc = 0.0
        params.mnd_wsc = 0.3
        params.chr_wsc = 0.0
        
    local multi = 1.08
    if (caster:hasStatusEffect(dsp.effect.AZURE_LORE)) then
        multi = multi + 0.50
    end
    local resist = applyResistance(caster, target, spell, params)
    local HP = caster:getHP()
    local LVL = caster:getMainLvl()
    local damage = math.floor(((HP / 2) + LVL) * (1 + (caster:getMod(dsp.mod.BREATH_DAMAGE) / 100)))
    damage = BlueFinalAdjustments(caster, target, spell, damage, params)

    if (damage > 0 and resist > 0.3) then
        local typeEffect = dsp.effect.POISON
        target:delStatusEffect(typeEffect)
        target:addStatusEffect(typeEffect,4,0,getBlueEffectDuration(caster,resist,typeEffect))
    end

    return damage
end