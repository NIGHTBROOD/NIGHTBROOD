-----------------------------------------
-- ID: 17738
-- Item: Hauteclaire
-- Additional Effect: Light Damage
-----------------------------------------
require("scripts/globals/status")
require("scripts/globals/magic")
require("scripts/globals/msg")
-----------------------------------

function onAdditionalEffect(player,target,damage)
    local chance = 20
    if (math.random(0,99) >= chance) then
        return 0,0,0
    else
        local dmg = math.random(10,25)
        local params = {}
        params.bonusmab = 0
        params.includemab = false
        dmg = addBonusesAbility(player, dsp.magic.ele.LIGHT, target, dmg, params)
        dmg = adjustForTarget(target,dmg,dsp.magic.ele.LIGHT)
        dmg = finalMagicNonSpellAdjustments(player,target,dsp.magic.ele.LIGHT,dmg)
        dmg = utils.clamp(dmg, 0, 99999)
        return dsp.subEffect.LIGHT_DAMAGE, dsp.msg.basic.ADD_EFFECT_DMG, dmg
    end
end