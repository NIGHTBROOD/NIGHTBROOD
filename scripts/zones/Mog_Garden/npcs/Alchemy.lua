
local ID = require("scripts/zones/Mog_Garden/IDs")
require("scripts/globals/shop")

function onTrade(player,npc,trade)
end

function onTrigger(player,npc)
    local stock =
    {
921,1000,
935,5000,
2361,800,
937,300,
1626,3000,
922,300,
912,200,
1110,20000,
2014,500,
929,500,
1592,6500,
932,5000,
931,5000,
1630,1000,
927,5000,
2365,600,
1165,1500,
1443,2000,
923,500,
924,2000,
947,1500,
1524,1000,
933,700,
2840,10000,
2013,500,
926,500,
920,1000,
914,1500,
918,2000,
2524,5500,
942,5500,
952,500,
943,300,
2301,500,
2513,500,
940,2500,
936,100,
1888,3000,
1521,1000,
637,500,
1108,500,
953,200,
    }
    player:PrintToPlayer("Welcome to Nightbrood's Custom Alchemy Vendor")
    dsp.shop.general(player, stock)
end

function onEventUpdate(player,csid,option)
end

function onEventFinish(player,csid,option)
end
