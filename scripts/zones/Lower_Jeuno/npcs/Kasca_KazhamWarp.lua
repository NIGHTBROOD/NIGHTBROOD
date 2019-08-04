-----------------------------------
-- Area: Lower Jeuno
--  NPC: Vingijard
-- Standard Info NPC
-----------------------------------

function onTrade(player,npc,trade)
	player:setPos (348, -2.5, -570, 0, 280);
end;

function onTrigger(player,npc)
    player:PrintToPlayer("Trade me any item to warp to the new hangout (You will NOT lose your item)")
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;
