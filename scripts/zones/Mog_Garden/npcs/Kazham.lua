function onTrade(player,npc,trade)
	player:setPos(-42.5844, -10, -93.7520, 0, 250);
end;

function onTrigger(player,npc)
    player:PrintToPlayer("Trade me any item to warp to Kazham (You will NOT lose your item)")
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;
