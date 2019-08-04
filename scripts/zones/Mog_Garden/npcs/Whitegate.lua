function onTrade(player,npc,trade)
	player:setPos(-99.36, 0.00, -72.699, 0, 50);
end;

function onTrigger(player,npc)
    player:PrintToPlayer("Trade me any item to warp to Whitegate (You will NOT lose your item)")
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;
