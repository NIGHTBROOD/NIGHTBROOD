local ID = require("scripts/zones/Mog_Garden/IDs")
require("scripts/globals/shop")

function onTrade(player,npc,trade)
end

function onTrigger(player,npc)
    local stock =
    {
        529,1000,
        816,500,
        817,100,
        818,1000,
        819,700,
        820,1000,
        821,30000,
        822,1500,
        823,15000,
        824,500,
        825,1000,
        828,10000,
        831,200000,
        833,50,
        834,200,
        836,50000,
        837,20000,
        838,2420,
        839,500,
        840,1000,
        841,100,
        842,4500,
        843,4500,
        846,100,
        847,1000,
        1132,50000,
        1163,5000,
        1270,10000,
        1281,50000,
        1294,5000,
        1313,100000,
        1619,5000,
        1636,10000,
        1700,5000,
        1713,500000,
        1764,2500,
        1845,200,
        2145,500,
        2149,5000,
        2150,1000,
        2166,2500,
        2173,405,
        2287,5000,
        2295,100,
        2337,2000,
        2522,1000,
        2539,4000,
        2827,10000,
        2835,5000,
        2838,1000,
        2856,50000,
    }
    player:PrintToPlayer("Welcome to Nightbrood's Custom Clothcraft Vendor")
    dsp.shop.general(player, stock)
end

function onEventUpdate(player,csid,option)
end

function onEventFinish(player,csid,option)
end
