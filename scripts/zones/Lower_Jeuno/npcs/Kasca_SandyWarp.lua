-----------------------------------
-- Area: Lower Jeuno
--  NPC: Vingijard
-- Standard Info NPC
-----------------------------------

function onTrade(player,npc,trade)
	player:setPos(85.6955, 0.00, 6.2852, 0, 231);
end;

function onTrigger(player,npc)
    player:PrintToPlayer("Trade me any item to warp to Sandy (You will NOT lose your item)")
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;
