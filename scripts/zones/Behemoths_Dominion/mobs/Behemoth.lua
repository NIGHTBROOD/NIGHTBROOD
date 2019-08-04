-----------------------------------
-- Area: Behemoth's Dominion
--  HNM: Behemoth
-----------------------------------
local ID = require("scripts/zones/Behemoths_Dominion/IDs")
mixins = {require("scripts/mixins/rage")}
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/titles")
-----------------------------------

function onMobSpawn(mob)
    if LandKingSystem_NQ > 0 or LandKingSystem_HQ > 0 then
        --GetNPCByID(ID.npc.BEHEMOTH_QM):setStatus(dsp.status.DISAPPEAR)
    end
    if LandKingSystem_HQ == 0 then
        SetDropRate(270,3342,0) -- do not drop savory_shank
    end

    mob:setLocalVar("[rage]timer", 1800) -- 30 minutes
end

function onMobDeath(mob, player, isKiller)
    player:addTitle(dsp.title.BEHEMOTHS_BANE)
    player:addCurrency('bayld', 1);
    player:messageSpecial(ID.text.BAYLD_OBTAINED, 1);
end

function onMobDespawn(mob)
    local ToD = GetServerVariable("[POP]King_Behemoth")
    local kills = GetServerVariable("[PH]King_Behemoth")
    local popNow = (math.random(1,4) == 3 or kills > 6)

    if LandKingSystem_HQ ~= 1 and ToD <= os.time() and popNow then
        -- 0 = timed spawn, 1 = force pop only, 2 = BOTH
        if LandKingSystem_NQ == 0 then
            DisallowRespawn(ID.mob.BEHEMOTH, true)
        end

        DisallowRespawn(ID.mob.KING_BEHEMOTH, false)
        UpdateNMSpawnPoint(ID.mob.KING_BEHEMOTH)
        GetMobByID(ID.mob.KING_BEHEMOTH):setRespawnTime(math.random(28800,36000))
    else
        if LandKingSystem_NQ ~= 1 then
            UpdateNMSpawnPoint(ID.mob.BEHEMOTH)
            mob:setRespawnTime(math.random(28800,36000))
            SetServerVariable("[PH]King_Behemoth", kills + 1)
        end
    end
end