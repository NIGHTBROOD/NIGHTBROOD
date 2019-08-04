---------------------------------------------

---------------------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/monstertpmoves")
---------------------------------------------

function onMobSkillCheck(target,mob,skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local SubZero = 1200 / skill:getTotalTargets()

    local dmg = MobFinalAdjustments(SubZero,mob,skill,target,dsp.attackType.PHYSICAL,dsp.damageType.LIGHT,MOBPARAM_WIPE_SHADOWS)

    target:takeDamage(dmg, mob, dsp.attackType.PHYSICAL, dsp.damageType.LIGHT)

    return dmg
end
