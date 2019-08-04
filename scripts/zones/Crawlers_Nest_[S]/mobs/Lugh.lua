-----------------------------------
-- Area: Crawler's Nest [S]
--   NM: Lugh
-----------------------------------
mixins = {require("scripts/mixins/job_special"), require("scripts/mixins/families/lugh")}
local ID = require("scripts/zones/Crawlers_Nest_[S]/IDs")
-----------------------------------
require("scripts/globals/titles")
require("scripts/globals/status")
require("scripts/globals/magic")
require("scripts/globals/msg")
require("scripts/globals/mobs")
-----------------------------------

function onMobInitialize(mob)
    mob:setLocalVar("[colibri]reflect_blue_magic", 1);
    mob:addMod(dsp.mod.MATT, -25);
    mob:addMod(dsp.mod.STR, 50);
    mob:addMod(dsp.mod.ATT, 100);
    mob:setMobMod(dsp.mobMod.DRAW_IN, 1)
    mob:setMobMod(dsp.mobMod.ADD_EFFECT, 1);
end

function onMobSpawn(mob)
    dsp.mix.jobSpecial.config(mob, {
        between = 30,
        specials =
        {
            { 
                id = dsp.jsa.MIGHTY_STRIKES,
                hpp = 35,
                cooldown = 600,
            }
            
        },
    })
end

function onAdditionalEffect(mob, target, damage)
    return dsp.mob.onAddEffect(mob, target, damage, dsp.mob.ae.PLAGUE, {chance = 100, power = 3})
end

function onMobDeath(mob, player, isKiller)
    player:addTitle(dsp.title.LUGH_EXORCIST);
    player:addCurrency('bayld', 2);
    player:messageSpecial(ID.text.BAYLD_OBTAINED, 2);
end

function onMobDespawn(mob)
    mob:setRespawnTime(math.random(14400,16200));
end