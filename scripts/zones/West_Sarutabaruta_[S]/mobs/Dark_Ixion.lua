-----------------------------------
-- Area: West Sarutabaruta [S]
--  MOB: Dark Ixion
-----------------------------------

local ID = require("scripts/zones/West_Sarutabaruta_[S]/IDs")
require("scripts/globals/titles")

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
    mob:addStatusEffect(11, mob:speed(), 0 , 65534);
    --[[ local rand = math.random(1,6);

    if(rand == 1) then
       mob:setPos(231.000, -24.133, 258.000, 0, 95);
    elseif(rand == 2) then
       mob:setPos(20.000, -0.758, -328.000, 0, 95);
    elseif(rand == 3) then
       mob:setPos(-398.000, 3.742, -355.000, 0, 95);
    elseif(rand == 4) then
       mob:setPos(-198.000, -18.256, 422.000, 0, 95);
    elseif(rand == 5) then
       mob:setPos(-107.000, -22.881, 119.000, 0, 95);
    elseif(rand == 6) then
       mob:setPos(358.000, -22.257, 582.000, 0, 95);
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