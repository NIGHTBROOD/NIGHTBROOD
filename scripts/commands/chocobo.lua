-----------------------------------------------------------------
--@chocobo
--calls chocobo
-----------------------------------------------------------------


cmdprops =
{
    permission = 5,
    parameters = "s"
};


function onTrigger(player)
player:addStatusEffect(dsp.mount.chocobo, 1, 0, 240);   -- The 99999 is a time it lasts. I just wanted it to never wear basically
end;