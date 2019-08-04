-----------------------------------
-- Area: Lower Jeuno
--  NPC: Vingijard
-- Standard Info NPC
-----------------------------------

function onTrade(player,npc,trade)
	player:setPos(-186.2375, -8.00, -34.0902, 0, 235);
end;

function onTrigger(player,npc)
    player:PrintToPlayer("Trade me any item to warp to Bastok (You will NOT lose your item)")
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;
