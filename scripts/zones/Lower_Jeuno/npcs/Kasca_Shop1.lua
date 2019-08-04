-----------------------------------
-- Area: Lower Jeuno
--  NPC: Kasca_Shop1
-- Standard Merchant NPC
-----------------------------------
local ID = require("scripts/zones/Lower_Jeuno/IDs")
require("scripts/globals/shop")

function onTrade(player,npc,trade)
end

function onTrigger(player,npc)
    local stock =
    {
		-- dream set
        15178,  100000,    
		10382,  100000,    
		11965,  100000,    
		11967,  100000,    
		14519,  100000,    
		15752,  100000,    
		18863,  100000, 

		-- creek
		10260,  100000,    
		10261,  100000,    
		10334,  100000,    
		10335,  100000,    
		
		-- marine
		10330,  100000,    
		10331,  100000, 

		-- woodsy
		10332,  100000,
		10333,  100000,
		
		-- custom
		16321,  100000,
		16322,  100000,
		
		-- magna
		16323,  100000,
		16324,  100000,
		
		-- wonder
		16325,  100000,
		16326,  100000,		
		
		-- savage
		16327,  100000,
		
		-- Dont know
		11265,  100000,
		11266,  100000,
		11267,  100000,
		11268,  100000,
		11269,  100000,
		11270,  100000,
		11271,  100000,
		
		-- novennial
		11853,  200000,
		11854,  200000,		
		11956,  200000,
		11957,  200000,
		
		-- Starlet Jabot Set
		25607,	200000,
		26975,	200000,
		27112,	200000,
		27297,	200000,
		27468,	200000,
		
		11538, 100,
    }

    player:PrintToPlayer("Welcome to the Nightbrood Custom Vendor 1")
    dsp.shop.general(player, stock)
end

function onEventUpdate(player,csid,option)
end

function onEventFinish(player,csid,option)
end
