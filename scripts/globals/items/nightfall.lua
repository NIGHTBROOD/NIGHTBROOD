-----------------------------------------
-- ID: 16910
-- Item: Nightfall
-- Additional Effect: Terror
-----------------------------------------
require("scripts/globals/status")
require("scripts/globals/magic")
require("scripts/globals/msg")
-----------------------------------

function onAdditionalEffect(player,target,damage)
    local chance = 15

    if (math.random(0,99) >= chance or applyResistanceAddEffect(player,target,dsp.magic.ele.DARK,0) <= 0.5) then
        return 0,0,0
    else
        target:addStatusEffect(dsp.effect.TERROR, 1, 0, 5)
        return dsp.subEffect.TERROR, dsp.msg.basic.ADD_EFFECT_STATUS, dsp.effect.TERROR
    end
end

