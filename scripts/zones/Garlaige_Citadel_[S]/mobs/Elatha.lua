-----------------------------------
-- Area: Garlage Citadel [S]
--   NM: Elatha
-----------------------------------
-- mixins = {require("scripts/mixins/families/colibri_mimic")}
mixins = {require("scripts/mixins/job_special"), require("scripts/mixins/families/elatha")}
local ID = require("scripts/zones/Garlaige_Citadel_[S]/IDs")
-----------------------------------
require("scripts/globals/titles")
require("scripts/globals/status")
require("scripts/globals/magic")
require("scripts/globals/msg")
-----------------------------------

function onMobInitialize(mob)
    mob:setLocalVar("AtkSpeed", false);
    mob:setLocalVar("[colibri]reflect_blue_magic", 1);
    mob:addMod(dsp.mod.FASTCAST, 50);
    mob:addMod(dsp.mod.MACC, 25);
    mob:setMobMod(dsp.mobMod.ADD_EFFECT, 1)
    mob:setMobMod(dsp.mobMod.DRAW_IN, 1)
    mob:setMobMod(dsp.mobMod.AUTO_SPIKES, 1);
    mob:addStatusEffect(dsp.effect.ICE_SPIKES, 50, 0, 0);
    mob:getStatusEffect(dsp.effect.ICE_SPIKES):setFlag(dsp.effectFlag.DEATH);
end

function onMobSpawn(mob)
    dsp.mix.jobSpecial.config(mob, {
        between = 30,
        specials =
        {
            { 
                id = dsp.jsa.BLOOD_WEAPON,
                hpp = 35,
                cooldown = 600,
                endCode = function(mob)
                    mob:useMobAbility(631)
                end,
            }
            
        },
    })
end

function onMobFight(mob,target)
    local AtkSpeedBuff = mob:getLocalVar("AtkSpeed");
    if (mob:hasStatusEffect(dsp.effect.BLOOD_WEAPON) == true and AtkSpeedBuff == false) then
        mob:addMod(dsp.mod.HASTE_ABILITY, 330);
        mob:setLocalVar("AtkSpeed", true);
    end
end

function onAdditionalEffect(mob, target, damage)
    return dsp.mob.onAddEffect(mob, target, damage, dsp.mob.ae.ENBLIZZARD, { chance = 100 })
end

function onSpikesDamage(mob, target, damage)
    local INT_diff = mob:getStat(dsp.mod.INT) - target:getStat(dsp.mod.INT);

    if INT_diff > 20 then
        INT_diff = 20 + (INT_diff - 20) * 0.66;
    end

    local dmg = (damage + INT_diff) * 0.2;
    local params = {};
    params.bonusmab = 0;
    params.includemab = false;
    dmg = addBonusesAbility(mob, dsp.magic.ele.ICE, target, dmg, params);
    dmg = dmg * applyResistanceAddEffect(mob, target, dsp.magic.ele.ICE, 0);
    dmg = adjustForTarget(target, dmg, dsp.magic.ele.ICE);
    dmg = finalMagicNonSpellAdjustments(mob, target, dsp.magic.ele.ICE, dmg);

    if dmg < 0 then
        dmg = 0;
    end

    return dsp.subEffect.ICE_SPIKES, dsp.msg.basic.SPIKES_EFFECT_DMG, dmg;
end

function onMobDeath(mob, player, isKiller)
    player:addTitle(dsp.title.ELATHA_EXORCIST);
    player:addCurrency('bayld', 2);
    player:messageSpecial(ID.text.BAYLD_OBTAINED, 2);
end

function onMobDespawn(mob)
    mob:setRespawnTime(math.random(14400,16200));
end