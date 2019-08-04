-----------------------------------
-- Area: Lower Jeuno
--  NPC: Zalsuhm
-- Standard Info NPC
-----------------------------------
local ID = require("scripts/zones/Lower_Jeuno/IDs")
require("scripts/globals/equipment")
require("scripts/globals/npc_util")
require("scripts/globals/quests")
require("scripts/globals/status")
require("scripts/globals/weaponskillids")
-----------------------------------

function getQuestId(mainJobId)

    return (UNLOCKING_A_MYTH_WARRIOR - 1 + mainJobId);

end;

function onTrade(player,npc,trade)

    -- printf("LowerJeuno_Zalsuhm.onTrade() - ");

    -- if (trade:getItemCount() == 1) then
        for i, wepId in pairs(BaseNyzulWeapons) do
            -- if (trade:hasItemQty(wepId, 1)) then
	    if npcUtil.tradeHasExactly(trade, wepId) then
                local unlockingAMyth = player:getQuestStatus(JEUNO, getQuestId(i))
                -- printf("\tUnlockingAMyth" .. i .. " = %u", unlockingAMyth);

                if (unlockingAMyth == QUEST_ACCEPTED) then
                    -- TODO: Logic for checking weapons current WS points
                    -- local wsPoints = 0;
		    local wsPoints = trade:getItem(0):getWeaponskillPoints()
                    -- printf("\twsPoints = %u", wsPoints);

                    if (wsPoints >= 0 and wsPoints <= 49) then
                        player:startEvent(10091); -- Lowest Tier Dialog
                    elseif (wsPoints <= 200) then
                        player:startEvent(10092); -- Mid Tier Dialog
                    elseif (wsPoints <= 249) then
                        player:startEvent(10093); -- High Tier Dialog
                    elseif (wsPoints >= 250) then
                        player:startEvent(10088, i); -- Quest Complete!
                    end
                end

                return;
            end
        end
    -- end

end;

function onTrigger(player,npc)

    -- printf("LowerJeuno_Zalsuhm.onTrigger() - ");

    local mainJobId = player:getMainJob();

    local unlockingAMyth = player:getQuestStatus(JEUNO, getQuestId(mainJobId))
    -- printf("\tUnlockingAMyth" .. mainJobId .. " = %u", unlockingAMyth);

    -- local mainWeaponId = player:getEquipID(dsp.slot.MAIN);
    
    -- printf("\tmainWeaponId: %u", mainWeaponId);
        
    -- local nyzulWeapon = isBaseNyzulWeapon(mainWeaponId);
    -- printf("\tIsBaseNyzulWeapon: %s", (nyzulWeapon and "TRUE" or "FALSE"));
    local nyzulWeaponMain = isBaseNyzulWeapon(player:getEquipID(dsp.slot.MAIN))
    local nyzulWeaponRanged = isBaseNyzulWeapon(player:getEquipID(dsp.slot.RANGED))
    if (unlockingAMyth == QUEST_AVAILABLE) then
        -- local zalsuhmUpset = player:getVar("Upset_Zalsuhm");
        -- if (player:needToZone() and zalsuhmUpset > 0) then -- Zalsuhm is still angry
	if player:needToZone() and player:getVar("Upset_Zalsuhm") > 0 then
            player:startEvent(10090);
        else
            -- if (zalsuhmUpset > 0) then
	    if player:getVar("Upset_Zalsuhm") > 0 then
                player:setVar("Upset_Zalsuhm", 0);
            end

            -- if (nyzulWeapon) then -- The player has a Nyzul weapon in the mainHand, try to initiate quest
	    if nyzulWeaponMain or nyzulWeaponRanged then
                player:startEvent(10086, mainJobId);
            else
                player:startEvent(10085); -- Default dialog
            end
        end
    elseif (unlockingAMyth == QUEST_ACCEPTED) then -- Quest is active for current job
        player:startEvent(10087); -- Zalsuhm asks for the player to show him the weapon if they sense a change
    else -- Quest is complete for the current job
        player:startEvent(10089);
    end
    
end;

function onEventUpdate(player,csid,option)

    -- printf("LowerJeuno_Zalsuhm.onEventUpdate() - ");
    -- printf("\tCSID: %u", csid);
    -- printf("\tRESULT: %u", option);

end;

function onEventFinish(player,csid,option)
    local questId = getQuestId(option)
    -- printf("LowerJeuno_Zalsuhm.onEventFinish() - ");
    -- printf("\tCSID: %u", csid);
    -- printf("\tRESULT: %u", option);

    -- Zalsuhm wants to research the player's Nyzul Weapon
    if (csid == 10086) then
        -- The player chose "He has shifty eyes" (turns down the quest)
        if (option == 53) then
            player:setVar("Upset_Zalsuhm", 1);
            player:needToZone(true);
        elseif (option <= dsp.job.SCH) then -- Just to make sure we didn't get into an invalid state
            -- The player chose "More power" (accepts the quest)
            -- local questId = getQuestId(option);
            player:addQuest(JEUNO, questId);
        end
    elseif (csid == 10088 and option <= dsp.job.SCH) then -- The quest is completed
        -- local questId = getQuestId(option);
	local jobs = 
        {
            [dsp.job.WAR] = dsp.ws_unlock.KINGS_JUSTICE,
            [dsp.job.MNK] = dsp.ws_unlock.ASCETICS_FURY,
            [dsp.job.WHM] = dsp.ws_unlock.MYSTIC_BOON,
            [dsp.job.BLM] = dsp.ws_unlock.VIDOHUNIR,
            [dsp.job.RDM] = dsp.ws_unlock.DEATH_BLOSSOM,
            [dsp.job.THF] = dsp.ws_unlock.MANDALIC_STAB,
            [dsp.job.PLD] = dsp.ws_unlock.ATONEMENT,
            [dsp.job.DRK] = dsp.ws_unlock.INSURGENCY,
            [dsp.job.BST] = dsp.ws_unlock.PRIMAL_REND,
            [dsp.job.BRD] = dsp.ws_unlock.MORDANT_RIME,
            [dsp.job.RNG] = dsp.ws_unlock.TRUEFLIGHT,
            [dsp.job.SAM] = dsp.ws_unlock.TACHI_RANA,
            [dsp.job.NIN] = dsp.ws_unlock.BLADE_KAMU,
            [dsp.job.DRG] = dsp.ws_unlock.DRAKESBANE,
            [dsp.job.SMN] = dsp.ws_unlock.GARLAND_OF_BLISS,
            [dsp.job.BLU] = dsp.ws_unlock.EXPIACION,
            [dsp.job.COR] = dsp.ws_unlock.LEADEN_SALUTE,
            [dsp.job.PUP] = dsp.ws_unlock.STRINGING_PUMMEL,
            [dsp.job.DNC] = dsp.ws_unlock.PYRRHIC_KLEOS,
            [dsp.job.SCH] = dsp.ws_unlock.OMNISCIENCE,
        }
        local skill = jobs[option]
        
        player:completeQuest(JEUNO, questId)
        player:messageSpecial(ID.text.MYTHIC_LEARNED, player:getMainJob())
        player:addLearnedWeaponskill(skill)
    end

end;
