-----------------------------------
-- Area: Fort Karugo-Narugo [S]
--  MOB: Dark Ixion
-----------------------------------

local ID = require("scripts/zones/Fort_Karugo-Narugo_[S]/IDs")
require("scripts/globals/titles");

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
    mob:addStatusEffect(11, mob:speed(), 0 , 65534);
    --[[ local rand = math.random(1,6);

    if(rand == 1) then
       mob:setPos(-237.000, -60.322, -237.000, 0, 96);
    elseif(rand == 2) then
       mob:setPos(-481.000, -28.001, 44.000, 0, 96);
    elseif(rand == 3) then
       mob:setPos(-441.000, -27.404, 334.000, 0, 96);
    elseif(rand == 4) then
       mob:setPos(-279.000, -27.604, 612.000, 0, 96);
    elseif(rand == 5) then
       mob:setPos(-634.000, -27.308, -413.000, 0, 96);
    elseif(rand == 6) then
       mob:setPos(448.000, -8.206, 188.000, 0, 96);
    end ]]
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    player:addTitle(dsp.title.IXION_HORNBREAKER);
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