
local ID = require("scripts/zones/Mog_Garden/IDs")
require("scripts/globals/shop")

function onTrade(player,npc,trade)
end

function onTrigger(player,npc)
    local stock =
    {
642,100,
644,500,
650,500,
653,1500,
736,400,
737,8000,
738,20000,
739,50000,
744,1000,
745,10000,
746,20000,
747,100000,
748,5000,
749,3000,
750,2000,
751,5000,
768,100,
769,500,
770,500,
771,500,
772,500,
773,500,
774,500,
775,500,
776,500,
1271,5000,
1274,25000,
786,10000,
785,5000,
784,5000,
787,5000,
788,5000,
794,5000,
793,5000,
2275,500000,
1299,500000,
1300,500000,
1301,500000,
1302,500000,
1303,500000,
1304,500000,
1305,500000,
1306,500000,
1460,5000000,

    }
    player:PrintToPlayer("Welcome to Nightbrood's Custom Goldsmithing Vendor")
    dsp.shop.general(player, stock)
end

function onEventUpdate(player,csid,option)
end

function onEventFinish(player,csid,option)
end
