-----------------------------------
-- Area: Mhaura
--  NPC: Grimr
-- Type: Standard NPC
-- !pos 31.819 -11.001 22.311 249
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    player:startEvent(120);
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
    if(csid==120) then
        player:setPos(-12,2,-142,0,50);
    end
end;
