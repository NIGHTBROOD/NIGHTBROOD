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


local prizes = 
{
	1,{ 17440, 1}, -- kclub
	2,{ 16555, 1}, -- ridill
	3,{ 16555, 1}, -- ridill
	4,{ 16555, 1},-- ridill
	5,{ 17652, 1}, -- joyeuse
	6,{ 17652, 1}, -- joyeuse
	7,{ 17652, 1}, -- joyeuse
	8,{ 17652, 1}, -- joyeuse
	9,{ 17652, 1}, -- joyeuse
	10,{ 18633, 1}, -- chatoyant staff
	11,{ 18633, 1}, -- chatoyant staff
	12,{ 18633, 1}, -- chatoyant staff
	13,{ 1453, 1}, -- montiont silverpiece
	14,{ 1453, 1}, -- montiont silverpiece
	15,{ 1453, 1}, -- montiont silverpiece
	16,{ 1450, 1}, -- lungo-nago jadeshell
	17,{ 1450, 1}, -- lungo-nago jadeshell
	18,{ 1450, 1}, -- lungo-nago jadeshell
	19,{ 1456, 1}, -- One hundred byne bill 
	20,{ 1456, 1}, -- One hundred byne bill 
	21,{ 1456, 1}, -- One hundred byne bill 
	22,{ 17024, 1}, -- Ash club lol ;)
}


function onTrade(player,npc,trade)
	
	if (player:getFreeSlotsCount() == 0) then
		player:PrintToPlayer("Please clear your inventory before playing!")
		return
	end
	
	
	local timer = player:getVar("Lottery_Timer");
	
	if (timer > os.time()) then
		player:PrintToPlayer("You may only play the lottery once an hour")
	else		
		player:setVar("Lottery_Timer",os.time()+(3600));
		local roll = math.random(0, 4000)	
				
		-- check bayId prize
		if (roll > 3995) then
			player:addCurrency('bayld', 50)
			--player:messageSpecial(BAYLD_OBTAINED, 50)
			player:PrintToPlayer("Congratulations! You won 50 bayId!")
			return
		end
		
		-- gil prize
		if (roll > 3990) then			
			player:PrintToPlayer("Congratulations! You won 1 million gil!")
			player:addGil(1000000);
			player:messageSpecial(ID.text.GIL_OBTAINED,1000000);
			return
		end		
		
		-- send them to tiamat lol
		if (roll > 3500) then			
			SpawnMob(16806227);
			player:PrintToPlayer("Oh no! you are super unlucky!")
			player:setPos(-560.4790, -11.17, -56.52, 0, 7);
			return
		end
		
		
		-- kill them lol
		if (roll > 3200) then						
			player:PrintToPlayer("Oh no! you are super unlucky!")
			player:setHP(0);
			return
		end
			
			
		-- check item prizes
		for index = 1, table.getn(prizes), 2 do				
			itemId = prizes[index+1][1]
			if (roll == prizes[index]) then	
				if (player:hasItem(itemId)) then
					-- already has item so send them to tiamat
					SpawnMob(16806227);
					player:PrintToPlayer("Oh no! you are super unlucky!")
					player:setPos(-560.4790, -11.17, -56.52, 0, 7);
					return
				else					
					player:addItem(itemId);
					player:PrintToPlayer("Congratulations! You won an item.")
					player:messageSpecial(ID.text.ITEM_OBTAINED, itemId); 
					return					
				end
			end
		end		
		player:PrintToPlayer("You lose... Better luck next time!")
	end
	
end;

function onTrigger(player,npc)
    player:PrintToPlayer("Welcome to Nightbrood's Lottery! Trade me an item for a chance to win a prize (you will not lose the item)")
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;
