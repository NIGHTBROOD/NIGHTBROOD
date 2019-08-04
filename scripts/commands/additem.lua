---------------------------------------------------------------------------------------------------
-- func: additem <itemId> <quantity>
-- desc: Adds an item to the GMs inventory.
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 2,
    parameters = "iii"
};

function error(player, msg)
    player:PrintToPlayer(msg);
    player:PrintToPlayer("!additem <itemId> {quantity}");
end;

function onTrigger(player, itemId, quantity)
    -- Load needed text ids for players current zone..
    local ID = zones[player:getZoneID()]

    -- validate itemId
    if (itemId == nil or tonumber(itemId) == nil or tonumber(itemId) == 0) then
        error(player, "Invalid itemId.");
        return;
    end
    
    -- Ensure the GM has room to obtain the item...
    if (player:getFreeSlotsCount() == 0) then
        player:messageSpecial( ID.text.ITEM_CANNOT_BE_OBTAINED, itemId );
        return;
    end
    
    -- Give the GM the item...
    player:addItem( itemId, quantity );
    player:messageSpecial( ID.text.ITEM_OBTAINED, itemId );
end