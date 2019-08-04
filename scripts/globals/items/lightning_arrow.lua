-----------------------------------------
-- ID: 17324
-- Item: Lightning Arrow
-- Additional Effect: Lightning Damage
-----------------------------------------
require("scripts/globals/status")
require("scripts/globals/magic")
require("scripts/globals/msg")
-----------------------------------

function onAdditionalEffect(player,target,damage)
    local chance = 105
    --[[if (target:getMainLvl() > player:getMainLvl()) then
        chance = chance - 5 * (target:getMainLvl() - player:getMainLvl())
        chance = utils.clamp(chance, 5, 95)
    end]]
    if (math.random(0,99) >= chance) then
        return 0,0,0
    else
        local dmg = utils.clamp(player:getStat(dsp.mod.INT) - target:getStat(dsp.mod.INT)/2, 5, 150);
        local params = {}
        params.bonusmab = 0
        params.includemab = true;
        dmg = addBonusesAbility(player, dsp.magic.ele.LIGHTNING, target, dmg, params)
        dmg = adjustForTarget(target,dmg,dsp.magic.ele.LIGHTNING)
        dmg = finalMagicNonSpellAdjustments(player,target,dsp.magic.ele.LIGHTNING,dmg)
        return dsp.subEffect.LIGHTNING_DAMAGE, dsp.msg.basic.ADD_EFFECT_DMG, dmg
    end
end