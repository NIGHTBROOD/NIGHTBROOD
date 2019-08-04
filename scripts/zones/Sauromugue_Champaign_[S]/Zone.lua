-----------------------------------
--
-- Zone: Sauromugue_Champaign_[S] (98)
--
-----------------------------------
local ID = require("scripts/zones/Sauromugue_Champaign_[S]/IDs")
require("scripts/globals/quests")
require("scripts/globals/zone")
-----------------------------------

function onInitialize(zone)
    local rand = math.random(1,7);
    local Spawns = { 17109357, 17121693, 17138041, 17150317, 17166720, 17174888, 17178901 };
    
    for k,v in pairs(Spawns) do
        if(k==rand) then
            SpawnMob(v);
            DisallowRespawn(v, false);
        else
            DespawnMob(v);
            DisallowRespawn(v, true);
        end
    end
end;

function onZoneIn(player,prevZone)
    local cs = -1;
    if (player:getXPos() == 0 and player:getYPos() == 0 and player:getZPos() == 0) then
        player:setPos(-104,-25.36,-410,195);
    end
    if (prevZone == dsp.zone.ROLANBERRY_FIELDS_S and player:getQuestStatus(CRYSTAL_WAR, DOWNWARD_HELIX) == QUEST_ACCEPTED and player:getVar("DownwardHelix") == 2) then
        cs = 3;
    end
    return cs;
end;

function onRegionEnter(player,region)
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
    if (csid == 3) then
        player:setVar("DownwardHelix",3);
    end
end;