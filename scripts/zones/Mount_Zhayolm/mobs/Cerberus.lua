-----------------------------------
-- Area: Mount Zhayolm
--   NM: Cerberus
-----------------------------------
local ID = require("scripts/zones/Mount_Zhayolm/IDs")
require("scripts/globals/status")
require("scripts/globals/titles")
-----------------------------------

function onMobFight(mob, target)
    if mob:getHPP() > 25 then
        mob:setMod(dsp.mod.REGAIN, 10)
    else
        mob:setMod(dsp.mod.REGAIN, 70)
    end
end

function onMobDeath(mob, player, isKiller)
    player:addTitle(dsp.title.CERBERUS_MUZZLER)
    player:addCurrency('bayld', 1)
    player:messageSpecial(ID.text.BAYLD_OBTAINED, 1)
end

function onMobDespawn(mob)
    mob:setRespawnTime(172800 + math.random(0, 24) * 3600) -- 48 - 72 hours with 1 hour windows
end
