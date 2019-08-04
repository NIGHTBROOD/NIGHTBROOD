-----------------------------------
-- Ability: Azure Lore
-- Makes physical behave as if they has 3500 TP
-- For magical spells, Multiplier is increased.
-- Allows the creation of Skillchains and Magic Bursts without Chain Affinity or Burst Affinity, but does not give the respective damage bonuses.
-- Obtained: Blue Mage Level 1
-- Recast Time: 1:00:00
-- Duration: 0:00:30
-----------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
-----------------------------------

function onAbilityCheck(player,target,ability)
    return 0,0
end

function onUseAbility(player,target,ability)
    player:addStatusEffect(dsp.effect.AZURE_LORE,1,0,30)
end