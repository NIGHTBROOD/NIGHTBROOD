-----------------------------------
-- Area: Rolanberry Fields [S]
--  MOB: Dark Ixion
-----------------------------------

local ID = require("scripts/zones/Rolanberry_Fields_[S]/IDs")
require("scripts/globals/titles")

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
    mob:addStatusEffect(11, mob:speed(), 0 , 65534);
    --[[ local rand = math.random(1,6);

    if(rand == 1) then
       mob:setPos(25.000, -8.103, -346.000, 0, 91);
    elseif(rand == 2) then
       mob:setPos(236.000, 8.106, 125.000, 0, 91);
    elseif(rand == 3) then
       mob:setPos(180.000, -31.009, -200.000, 0, 91);
    elseif(rand == 4) then
       mob:setPos(-50.000, 0.024, -376.000, 0, 91);
    elseif(rand == 5) then
       mob:setPos(-638.000, -23.883, -199.000, 0, 91);
    elseif(rand == 6) then
       mob:setPos(-387.000, 0.463, 80.000, 0, 91);
    end ]]
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    player:addTitle(dsp.title.IXION_HORNBREAKER)
    player:addCurrency('bayld', 3);
    player:messageSpecial(ID.text.BAYLD_OBTAINED, 3);

    local rand = math.random(1,7);
    local Spawns = { 17109367, 17113468, 17121697, 17142112, 17150321, 17166730, 17170649 };
    
    for k,v in pairs(Spawns) do
        if(k==rand) then
            GetMobByID(v):setRespawnTime(math.random(72000,86400));
            DisallowRespawn(v, false);
        else
            DisallowRespawn(v, true);
        end
    end
end;

function onMobDisengage(mob)
    mob:addStatusEffect(11, mob:speed(), 0 , 65534);
end;

function onMobEngaged(mob, target)
    mob:delStatusEffect(11);
end