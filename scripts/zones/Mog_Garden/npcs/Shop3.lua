
local ID = require("scripts/zones/Mog_Garden/IDs")
require("scripts/globals/shop")

function onTrade(player,npc,trade)
end

function onTrigger(player,npc)
    local stock =
    {
17058,70000000,
14398,70000000,
13947,70000000,
14397,70000000,
13946,70000000,
14395,70000000,
13948,70000000,
14399,70000000,
13945,70000000,
14394,70000000,
14396,70000000,
14832,70000000,
14831,70000000,
14393,70000000,
14392,70000000,
14830,70000000,
3343,   50000000,       -- Blue Pondweed
3341,   50000000,       -- Beastly Shank
3339,   50000000,       -- Honey Wine
3344,   70000000,       -- Red Pondweed
3342,   70000000,       -- Savory Shank
3340,   70000000,       -- Sweet Tea
    }
    player:PrintToPlayer("Prepare to spend your gil ;)")
    dsp.shop.general(player, stock)
end

function onEventUpdate(player,csid,option)
end

function onEventFinish(player,csid,option)
end
