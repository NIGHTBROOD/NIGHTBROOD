
local ID = require("scripts/zones/Mog_Garden/IDs")
require("scripts/globals/shop")

function onTrade(player,npc,trade)
end

function onTrigger(player,npc)
    local stock =
    {
864,100,
866,10000,
867,25000,
868,100,
880,100,
881,1500,
882,300,
883,10000,
884,3500,
885,4000,
886,10000,
887,7000,
888,300,
889,500,
891,200,
893,1000,
894,800,
895,3000,
897,1700,
898,1000,
901,100000,
902,5000,
903,75000,
905,5000,
908,10000,
1123,1500,
1193,3000,
1272,1000,
1311,20000,
1473,2000,
1586,2000,
1587,3000,
1615,1000,
1616,1000,
1618,5000,
1620,1500,
1622,5000,
1718,10000,
1719,10000,
1770,1000,
1771,15000,
1883,2500,
1973,500,
1974,1000,
1975,10000,
2130,500,
2146,1000,
2157,1000,
2147,5000,
2171,600,
2420,5000,
2426,1500,
2427,1500,
2832,10000,
    }
    player:PrintToPlayer("Welcome to Nightbrood's Custom Bonecraft Vendor")
    dsp.shop.general(player, stock)
end

function onEventUpdate(player,csid,option)
end

function onEventFinish(player,csid,option)
end