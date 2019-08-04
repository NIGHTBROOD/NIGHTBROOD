-----------------------------------
-- Area: Lower Jeuno
-- NPC: Vigil Weapon NPC
-----------------------------------
local ID = require("scripts/zones/Lower_Jeuno/IDs")
require("scripts/globals/quests")

local weapons = 
{
    18492, -- Sturdy Axe (WAR)
    18753, -- Burning Fists (MNK)
    18851, -- Werebuster (WHM)
    18589, -- Mage's Staff (BLM)
    17742, -- Vorpal Sword (RDM)
    18003, -- Swordbreaker (THF)
    17744, -- Brave Blade (PLD)
    18944, -- Death Sickle (DRK)
    17956, -- Double Axe (BST)
    18034, -- Dancing Dagger (BRD)
    18719, -- Killer Bow (RNG)
    18443, -- Windslicer (SAM)
    18426, -- Sasuke Katana (NIN)
    18120, -- Radiant Lance (DRG)
    18590, -- Scepter Staff (SMN)
    17743, -- Wightslayer (BLU)
    18720, -- Quicksilver (COR)
    18754, -- Inferno Claws (PUP)
    19102, -- Main Gauche (DNC)
    18592, -- Elder Staff (SCH)
};
function onTrade(player,npc,trade)
    local jweapon = weapons[player:getMainJob()]
    if(trade:hasItemQty(jweapon,1)) then
        player:delQuest(3, getQuestId(player:getMainJob()))
        player:PrintToPlayer("Quest Deleted. You can talk to Zalsuhm again with your weapon equipped.")
    end
end;

function onTrigger(player,npc)
    if(player:getMainLvl() > 74) then
        local jweapon = weapons[player:getMainJob()]
        if(player:hasItem(weapons[player:getMainJob()])) then
            player:messageSpecial(ID.text.ITEM_CANNOT_BE_OBTAINED, jweapon)
        else
            player:addItem(jweapon)
            player:messageSpecial(ID.text.ITEM_OBTAINED, jweapon)
        end
    end
end;

function getQuestId(jobid)
    return (UNLOCKING_A_MYTH_WARRIOR - 1 + jobid)
end