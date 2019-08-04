---------------------------------------------------------------------------------------------------
-- func: giveitem <player> <itemId> <amount>
-- desc: Gives an item to the target player.
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 2,
    parameters = "sii"
};

function onTrigger(player, target, itemId, amount)
    if (target == nil or itemId == nil) then
        player:PrintToPlayer("You must enter a valid player name and item ID.");
        return;
    end

    local targ = GetPlayerByName( target );
    if (targ == nil) then
        player:PrintToPlayer( string.format( "Player named '%s' not found!", target ) );
        return;
    end

    -- Load needed text ids for target's current zone..
    local ID = zones[targ:getZoneID()]

    -- Attempt to give the target the item..
    if (targ:getFreeSlotsCount() == 0) then
        targ:messageSpecial( ID.text.ITEM_CANNOT_BE_OBTAINED, itemId );
        player:PrintToPlayer( string.format( "Player '%s' does not have free space for that item!", target ) );
    else
        targ:addItem( itemId, amount );
        targ:messageSpecial( ID.text.ITEM_OBTAINED, itemId );
        player:PrintToPlayer( string.format( "Gave player '%s' Item with ID of '%u' ", target, itemId ) );
    end
end;