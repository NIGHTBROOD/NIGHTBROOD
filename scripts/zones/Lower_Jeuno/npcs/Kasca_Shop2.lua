-----------------------------------
-- Area: Lower Jeuno
--  NPC: Kasca_Shop2
-- Standard Merchant NPC
-----------------------------------
local ID = require("scripts/zones/Lower_Jeuno/IDs")
require("scripts/globals/shop")

function onTrade(player,npc,trade)
end

function onTrigger(player,npc)
    local stock =
    {
		4167,  20,    	-- Cracker
		4215,  20,    	-- popstar
		5769,  20,    	-- popper
		4168,  20,		-- twinkle shower
		4216,  20,		-- brilliant snow
		4217,  20,		-- sparkling hand
		5532,  20,		-- Ichinintousen 
        5883,  20,    	-- Falling star
		4251,  20,		-- festive fan
		5725,  20,		-- Goshikitenge
		5937,  20,		-- Bubble Breeze
		5441,  50,		-- angelwing
		4257,  50,		-- Papillion
		
    }

    player:PrintToPlayer("Welcome to the Nightbrood Custom Vendor 2")
    dsp.shop.general(player, stock)
end

function onEventUpdate(player,csid,option)
end

function onEventFinish(player,csid,option)
end
