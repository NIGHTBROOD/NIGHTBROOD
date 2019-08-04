-----------------------------------
--
-- Zone: Fort_Karugo-Narugo_[S] (96)
--
-----------------------------------
local ID = require("scripts/zones/Fort_Karugo-Narugo_[S]/IDs");
require("scripts/globals/weather");
require("scripts/globals/status");
require("scripts/globals/helm")
-----------------------------------

function onInitialize(zone)
    dsp.helm.initZone(zone, dsp.helm.type.LOGGING)
    
    local rand = math.random(1,7);
    local Spawns = { 17109367, 17113468, 17121697, 17142112, 17150321, 17166730, 17170649 };
    
    for k,v in pairs(Spawns) do
        if(k==rand) then
            SpawnMob(v);
            DisallowRespawn(v, false);
        else
            DisallowRespawn(v, true);
        end
    end
end;

function onZoneIn(player,prevZone)
    local cs = -1;
    if (player:getXPos() == 0 and player:getYPos() == 0 and player:getZPos() == 0) then
        player:setPos(820,25.782,117.991,66);
    end
    return cs;
end;

function onRegionEnter(player,region)
end;

function onZoneWeatherChange(weather)
    npc = GetNPCByID(ID.npc.INDESCRIPT_MARKINGS);
    if (npc ~= nil) then
        if (weather == dsp.weather.DUST_STORM or weather == dsp.weather.SAND_STORM) then
            npc:setStatus(dsp.status.DISAPPEAR);
        else
            npc:setStatus(dsp.status.NORMAL);
        end
    end
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;
