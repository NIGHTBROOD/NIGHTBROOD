-----------------------------------
-- Area: Arrapago Remnants
--  MOB: Graverobber
-----------------------------------
mixins = {require("scripts/mixins/weapon_break")}
-----------------------------------

function onMobDeath(mob, player, isKiller)
end;

function onMobDespawn(mob)
    local instance = mob:getInstance()
    instance:setProgress(instance:getProgress() + 1)
end;