
local ID = require("scripts/zones/Mog_Garden/IDs")
require("scripts/globals/shop")

function onTrade(player,npc,trade)
end

function onTrigger(player,npc)
    local stock =
    {
874,100000,
1275,250000,
860,200000,
1628,5000,
1640,2000,
2169,500000,
854,2600,
857,4000,
863,3000,
1623,1500,
1767,10000,
1591,3000,
2156,6000,
878,1500000,
1869,1500,
869,600,
852,500,
2512,1000,
876,1000,
1116,5000,
2151,8000,
2121,15000,
1276,25000,
856,100,
859,15000,
853,2000,
505,500,
861,1000,
849,20000,
2428,5000,
858,800,
1122,5000,
1124,1000,
635,50,
4509,50,
4103,700,

    }
    player:PrintToPlayer("Welcome to Nightbrood's Custom Leathercraft Vendor")
    dsp.shop.general(player, stock)
end

function onEventUpdate(player,csid,option)
end

function onEventFinish(player,csid,option)
end
