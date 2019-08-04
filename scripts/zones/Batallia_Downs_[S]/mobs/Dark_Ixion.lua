-----------------------------------
-- Area: Batallia_Downs_[S]
--  MOB: Dark Ixion
-----------------------------------

local ID = require("scripts/zones/Batallia_Downs_[S]/IDs")
require("scripts/globals/titles");

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
    mob:addStatusEffect(11, mob:speed(), 0 , 65534);
	--[[ local rand = math.random(1,6);

    if(rand == 1) then
	   mob:setPos(-83.000, -8.000, 35.000, 0, 84);
	elseif(rand == 2) then
	   mob:setPos(73.000, -5.387, 106.000, 0, 84);
	elseif(rand == 3) then
	   mob:setPos(-205.000, -19.716, 128.000, 0, 84);
	elseif(rand == 4) then
	   mob:setPos(-273.000, -23.951, -47.000, 0, 84);
	elseif(rand == 5) then
	   mob:setPos(-425.000, -10.814, -6.000, 0, 84);
	elseif(rand == 6) then
	   mob:setPos(-389.000, -18.422, 185.000, 0, 84);
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