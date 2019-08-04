-----------------------------------------
-- ID: 17745
-- Item: Hofud
-- Additional effect: HP or MP Drain
-----------------------------------------
require("scripts/globals/status")
require("scripts/globals/magic")
require("scripts/globals/msg")
-----------------------------------

function onAdditionalEffect(player,target,damage)
    local chanceHP = 8
    local chanceMP = 8
    local drain = 0
    local params = {}
    params.bonusmab = 0
    params.includemab = false
    
    if (target:isUndead()) then
        return 0,0,0
    elseif (math.random(0,99) < chanceHP) then
        drain = math.random(10,20)
        drain = drain * applyResistanceAddEffect(player,target,dsp.magic.ele.DARK,0)
        drain = adjustForTarget(target,drain,dsp.magic.ele.DARK)
        drain = finalMagicNonSpellAdjustments(player,target,dsp.magic.ele.DARK,drain)
        return dsp.subEffect.HP_DRAIN, dsp.msg.basic.ADD_EFFECT_HP_DRAIN, player:addHP(drain)
    elseif (math.random(0,99) < chanceMP) then
        drain = math.random(5,10)
        drain = drain * applyResistanceAddEffect(player,target,dsp.magic.ele.DARK,0)
        drain = adjustForTarget(target,drain,dsp.magic.ele.DARK)
        drain = finalMagicNonSpellAdjustments(player,target,dsp.magic.ele.DARK,drain)
        if (drain > target:getMP()) then
            drain = target:getMP()
        end
        target:addMP(-drain)
        return dsp.subEffect.MP_DRAIN, dsp.msg.basic.ADD_EFFECT_MP_DRAIN, player:addMP(drain)
    end
end