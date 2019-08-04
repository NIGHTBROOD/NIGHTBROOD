-----------------------------------    
-- Area: Promyvion holla
-- Memory Flux
-- @pos 98 0 -139
-----------------------------------    
package.loaded["scripts/zones/Promyvion-Holla/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/zones/Promyvion-Holla/TextIDs");
require("scripts/globals/keyitems");
    
-----------------------------------    
-- onTrigger Action    
-----------------------------------    
    
function onTrigger(player,npc)    
    if (player:getQuestStatus(JEUNO,SHADOWS_OF_THE_DEPARTED) == QUEST_ACCEPTED and player:getVar('ShadowsDeparted') == 1 and player:hasKeyItem(PROMYVION_HOLLA_SLIVER) == false) then
        player:addKeyItem(PROMYVION_HOLLA_SLIVER);
	    player:messageSpecial(KEYITEM_OBTAINED,PROMYVION_HOLLA_SLIVER);
    else
        player:messageSpecial(NOTHING_OUT_OF_ORDINARY);
    end
end;    
    
-----------------------------------    
-- onTrade Action    
-----------------------------------    
    
function onTrade(player,npc,trade)    
end;    
    

    
-----------------------------------    
-- onEventFinish Action    
-----------------------------------    
    
function onEventFinish(player,csid,option)    
end;    