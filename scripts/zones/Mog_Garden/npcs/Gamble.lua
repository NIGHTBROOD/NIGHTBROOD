-----------------------------------
-- Area: Lower Jeuno
--  NPC: Vingijard
-- Standard Info NPC
-----------------------------------
require("scripts/globals/zone")
require("scripts/globals/settings");
require("scripts/globals/keyitems");
require("scripts/globals/quests");
require("scripts/globals/status")
local ID = require("scripts/zones/Lower_Jeuno/IDs");



function onTrade(player,npc,trade)

    local gil = trade:getGil();
    local count = trade:getItemCount();
	
	if (count == 1 and gil > 0) then
		local roll = math.random(0, 100)	
		player:tradeComplete();
		if (roll > 60) then
			player:PrintToPlayer("Congratulations! You win.")
			player:addGil(gil * 2);
			player:messageSpecial(ID.text.GIL_OBTAINED, gil * 2);
		else
			player:PrintToPlayer("You lost your gil. Better luck next time.")
		end	
	else
		player:PrintToPlayer("Trade me gil.. not items.")
	end
	
end;

function onTrigger(player,npc)
    player:PrintToPlayer("Trade me some gil for a chance to double it! It's a flip of the coin.")
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;
