-----------------------------------
-- Area:
--  NPC:
-- Notes:
-- !pos
-----------------------------------
local ID = require("scripts/zones/Halvung/IDs")
require("scripts/globals/npc_util")
-----------------------------------

function onTrade(player,npc,trade)
end

function onTrigger(player,npc)
    local Offset = 2
    local OpLev = npc:getID()
    if OpLev == 17031687 or OpLev == 17031679 or OpLev == 17031671 or OpLev == 17031683 or OpLev == 17031675 then
        Offset = 3
    end
    local OperatingLever = GetNPCByID(npc:getID() - Offset)

    -- if (player:hasKeyItem(dsp.ki.BRACELET_OF_VERVE) == true) then
       OperatingLever:openDoor(15);   -- Doors open on click until we add drops of the Item and ??? for the KI
    -- end
    -- player:messageSpecial(ID.text._msg_)
end

function onEventUpdate(player,csid,option)
end

function onEventFinish(player,csid,option)
end
