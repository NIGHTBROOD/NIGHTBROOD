---------------------------------------------------
-- Aerial Blast
-- Deals wind elemental damage to enemies within area of effect.
---------------------------------------------------

require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/monstertpmoves")

---------------------------------------------------

function onMobSkillCheck(target,mob,skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)

    local dmgmod = 3
    local info = MobMagicalMove(mob,target,skill,mob:getWeaponDmg() * 9,dsp.magic.ele.WIND,dmgmod,TP_NO_EFFECT,1)
    local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,dsp.attackType.MAGICAL,dsp.damageType.WIND,MOBPARAM_WIPE_SHADOWS)
    target:takeDamage(dmg, mob, dsp.attackType.MAGICAL, dsp.damageType.WIND)
    return dmg

end
