-----------------------------------
-- Area: Grauberg [S]
--  MOB: Dark Ixion
-----------------------------------

local ID = require("scripts/zones/Grauberg_[S]/IDs")
require("scripts/globals/titles");

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
    mob:addStatusEffect(11, mob:speed(), 0 , 65534);
    --[[ local rand = math.random(1,6);
    
    if(rand == 1) then
       mob:setPos(344.000, 36.587, -442.000, 0, 89);
    elseif(rand == 2) then
       mob:setPos(318.000, 48.000, 637.000, 0, 89);
    elseif(rand == 3) then
       mob:setPos(-87.000, -7.625, 629.000, 0, 89);
    elseif(rand == 4) then
       mob:setPos(-502.281, -167.730, 214.999, 0, 89);
    elseif(rand == 5) then
       mob:setPos(-12.000, 0.409, -476.000, 0, 89);
    elseif(rand == 6) then
       mob:setPos(-362.000, 16.368, -527.000, 0, 89);
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