-----------------------------------
-- Area: East Ronfaure
--  MOB: Forest Funguar
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 67, 2, dsp.regime.type.FIELDS)
end;