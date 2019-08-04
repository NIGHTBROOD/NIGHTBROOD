-----------------------------------
-- Area: Lower Jeuno
--  NPC: Vingijard
-- Standard Info NPC
-----------------------------------

function onTrade(player,npc,trade)
	player:setPos(-216.0336, 1.0, -128.1900, 0, 239);
end;

function onTrigger(player,npc)
    player:PrintToPlayer("Trade me any item to warp to Windy (You will NOT lose your item)")
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;
