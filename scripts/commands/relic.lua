---------------------------------------------------------------------------------------------------
-- func: relic
-- desc: checks time remaining on relic swap.
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 0,
    parameters = "ss"
};

function onTrigger(player, varType, varName)
    local last_time = player:getVar("RELIC_DUE_AT");
    local current_time = os.time();
    local time_remaining = last_time - current_time;
    
    if time_remaining > 0 then
        player:PrintToPlayer(string.format("Time remaining until Relic on Switchstix is Ready: %.2d:%.2d:%.2d", time_remaining/(60*60), time_remaining/60%60, time_remaining%60),15);
    else
        if player:getVar("RELIC_IN_PROGRESS") > 0 then
            player:PrintToPlayer("Your Relic is Ready for Pickup with Switchstix.", 15);
        else
            player:PrintToPlayer("You have no Relic on Switchstix in progress.", 15);
        end
    end
    last_time = player:getVar("RELIC_SWAP");
    current_time = os.time();
    time_remaining = last_time - current_time;
    if time_remaining > 0 then
        player:PrintToPlayer(string.format("Time remaining until Relic/Mythic Tidal Gate is Ready: %.2d:%.2d:%.2d", time_remaining/(60*60), time_remaining/60%60, time_remaining%60),15);
    else
        player:PrintToPlayer("Relic/Mythic Tidal Gate is Ready for your next exchange.",15);
    end
end-----