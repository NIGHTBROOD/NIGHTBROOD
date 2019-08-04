-----------------------------------
-- Area: Rolanberry Fields [S]
--  MOB: Sandworm
-- Note: Title Given if Sandworm does not Doomvoid
-----------------------------------

local ID = require("scripts/zones/Rolanberry_Fields_[S]/IDs")
require("scripts/globals/titles")

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller) 
    player:addTitle(dsp.title.SANDWORM_WRANGLER);
    player:addCurrency('bayld', 5);
    player:messageSpecial(ID.text.BAYLD_OBTAINED, 5);
    
    local rand = math.random(1,7);
    local Spawns = { 17109357, 17121693, 17138041, 17150317, 17166720, 17174888, 17178901 };
    
    for k,v in pairs(Spawns) do
        if(k==rand) then
            GetMobByID(v):setRespawnTime(math.random(72000,90000));
            DisallowRespawn(v, false);
        else
            DisallowRespawn(v, true);
        end
    end
end;