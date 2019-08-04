
local ID = require("scripts/zones/Mog_Garden/IDs")
require("scripts/globals/shop")

function onTrade(player,npc,trade)
end

function onTrigger(player,npc)
    local stock =
    {
645,8000,
640,50,
641,50,
643,500,
646,8000,
648,100,
649,200,
651,2000,
652,2000,
658,10000,
654,15000,
655,15000,
659,100,
685,500000,
686,1000000,
1155,1000,
1704,5000,
1705,10000,
2000,50000,
2531,500,
2764,5000,
2823,1000,
2852,1000,
657,1000,
3920,5000,
    }
    player:PrintToPlayer("Welcome to Nightbrood's Custom Smithing Vendor")
    dsp.shop.general(player, stock)
end

function onEventUpdate(player,csid,option)
end

function onEventFinish(player,csid,option)
end
