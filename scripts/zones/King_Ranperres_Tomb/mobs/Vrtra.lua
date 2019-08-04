-----------------------------------
-- Area: King Ranperre's Tomb
--  MOB: Vrtra
-----------------------------------
local ID = require("scripts/zones/King_Ranperres_Tomb/IDs")
require("scripts/globals/status");
require("scripts/globals/titles");
-----------------------------------

local offsets = {1, 3, 5, 2, 4, 6};

function onMobEngaged(mob, target)
    mob:resetLocalVars();
end;

function onMobFight(mob, target)
    local spawnTime = mob:getLocalVar("spawnTime");
    local twohourTime = mob:getLocalVar("twohourTime");

    if (twohourTime == 0) then
        twohourTime = math.random(4, 6);
        mob:setLocalVar("twohourTime", twohourTime);
    end

    if (spawnTime == 0) then
        spawnTime = math.random(3, 5);
        mob:setLocalVar("spawnTime", spawnTime);
    end

    if (mob:getBattleTime()/15 > twohourTime) then
        mob:useMobAbility(710);
        mob:setLocalVar("twohourTime", (mob:getBattleTime()/15)+math.random(4,6));
    elseif (mob:getBattleTime()/15 > spawnTime) then
        local mobId = mob:getID()

        for i, offset in ipairs(offsets) do
            local pet = GetMobByID(mobId + offset)

            if not pet:isSpawned() then
                pet:spawn(60)
                local pos = mob:getPos();
                pet:setPos(pos.x, pos.y, pos.z);
                pet:updateEnmity(target)
                break;
            end
        end
        mob:setLocalVar("spawnTime", (mob:getBattleTime()/15)+4);
    end
end;

function onMobDisengage(mob, weather)
    for i, offset in ipairs(offsets) do
        DespawnMob(mob:getID()+offset);
    end
end;

function onMobDeath(mob, player, isKiller)
    player:addTitle(dsp.title.VRTRA_VANQUISHER);
	player:addCurrency('bayld', 10);
    player:messageSpecial(ID.text.BAYLD_OBTAINED, 10);
end;

function onMobDespawn(mob)

    -- Set Vrtra's spawnpoint and respawn time (3-5 days)
    UpdateNMSpawnPoint(mob:getID());
    mob:setRespawnTime(math.random(259200,432000));

end;