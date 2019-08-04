
local ID = require("scripts/zones/Mog_Garden/IDs")
require("scripts/globals/shop")

function onTrade(player,npc,trade)
end

function onTrigger(player,npc)
    local stock =
    {
483,10000,
688,100,
689,100,
690,1723,
692,5000,
691,45,
693,640,
694,2119,
695,120,
696,330,
697,528,
698,60,
699,4740,
700,5075,
701,6615,
702,9600,
703,10000,
704,96,
705,30,
706,270,
707,1723,
708,45,
709,1000,
710,2119,
711,1015,
712,120,
713,330,
714,607,
715,72,
716,2740,
717,9075,
718,8000,
719,10552,
720,10000,
722,75000,
1242,100,
1243,100,
1244,100,
1245,100,
1246,100,
1247,100,
1248,100,
1249,100,
1250,100,
1251,100,
1253,100,
1254,100,

    }
    player:PrintToPlayer("Welcome to Nightbrood's Custom Woodworking Vendor")
    dsp.shop.general(player, stock)
end

function onEventUpdate(player,csid,option)
end

function onEventFinish(player,csid,option)
end
