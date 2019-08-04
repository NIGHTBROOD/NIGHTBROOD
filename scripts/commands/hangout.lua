---------------------------------------------------------------------------------------------------
-- func: warp
-- desc: Sends the target to their homepoint.
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 0,
    parameters = "ss"
};

function onTrigger(player, msg)
	local timer = player:getVar("Hangout_Timer");
    local targ = GetPlayerByName(player:getName());
    local gmlvl = player:getGMLevel();

	if (player:getZoneID() == 131) then
		player:PrintToPlayer( "Nice try." );
	elseif (timer > os.time() and gmlvl == 0) then
			player:PrintToPlayer( "You are trying to teleport to your home point too soon. Run you lazy bum!",15 );
            player:PrintToPlayer( "'!hangout' for new Hangout Zone",15 );
            player:PrintToPlayer( "'!hangout old' for Jeuno Hangout Zone",15 );
	else
		if msg == 'old' then
            targ:setPos(-12.53, -0.4, 3.2, 0, 245);
            player:PrintToPlayer( "'!hangout' for new Hangout Zone",15 );
        else
            targ:setPos (348, -2.5, -570, 0, 280);
            player:PrintToPlayer( "'!hangout old' for Jeuno Hangout Zone",15 );
        end
		player:setVar("Hangout_Timer",os.time()+900);
	end
end