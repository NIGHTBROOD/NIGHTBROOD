function onTrade(player,npc,trade)
	player:setPos(-22.328, 0.397, -45.121, 0, 252);
end;

function onTrigger(player,npc)
    player:PrintToPlayer("Trade me any item to warp to Norg (You will NOT lose your item)")
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;
