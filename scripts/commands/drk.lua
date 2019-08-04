---------------------------------------------------------------------------------------------------
-- func: drk
-- desc: checks the number of kills for DRK Unlock Quest.
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 0,
    parameters = "s"
};

function onTrigger(player)
    local drk_kills = player:getVar("ChaosbringerKills");
    local max_kills = 100;
    local kills_remaining = max_kills - drk_kills;
    
    if (kills_remaining <0) then
        kills_remaining = 0;
    end
    
    if drk_kills == 0 then
        player:PrintToPlayer("You can't be EMO yet, go get your Chaosbringer!", 21);
    elseif kills_remaining > 0 then
        player:PrintToPlayer(string.format("Kills remaining to be EMO: %u", kills_remaining),8);
    elseif drk_kills > 0 then
        player:PrintToPlayer("All Done now, go be EMO", 21);
    end
end