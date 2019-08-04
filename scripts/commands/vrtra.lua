cmdprops =
{
    permission = 2,
    parameters = "s"
};

function onTrigger(player, target)
    local targ;
    local Vrtra = GetMobByID(17555890);
    
    -- validate target
    if (target == nil) then
        targ = player:getCursorTarget();
        if (targ == nil or not targ:isPC()) then
            targ = player;
        end
    else
        targ = GetPlayerByName(target);
        if (targ == nil) then
            error(player, string.format("Player named '%s' not found!", target));
            return;
        end
    end
    
    targ:setPos(Vrtra:getXPos(), Vrtra:getYPos(), Vrtra:getZPos(), 0, 190);
end;