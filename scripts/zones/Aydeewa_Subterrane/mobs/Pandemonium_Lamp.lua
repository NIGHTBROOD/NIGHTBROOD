-----------------------------------
-- Area: Aydeewa Subterrane
--  ZNM: Pandemonium_Warden
-----------------------------------
require("scripts/globals/status");
require("scripts/globals/magic");

function onMobInitialize(mob)
    mob:setMobMod(dsp.mobMod.MAGIC_DELAY, 45);
    mob:setMobMod(dsp.mobMod.MAGIC_COOL, 45);
    mob:addStatusEffect(dsp.effect.SILENCE, 1, 0, 45);
end;

function onMobSpawn(mob)
    mob:setMobMod(dsp.mobMod.MAGIC_DELAY, 45);
    mob:setMobMod(dsp.mobMod.MAGIC_COOL, 45);
    mob:addStatusEffect(dsp.effect.SILENCE, 1, 0, 45);
end;
