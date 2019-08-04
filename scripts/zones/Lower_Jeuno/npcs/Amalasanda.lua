-----------------------------------
-- Area: Lower Jeuno
--  NPC: Amalasanda
-- Type: Tenshodo Merchant
-- !pos 28.149 2.899 -44.780 245
-----------------------------------
local ID = require("scripts/zones/Lower_Jeuno/IDs")
require("scripts/globals/keyitems")
require("scripts/globals/shop")

function onTrade(player,npc,trade)
end

function onTrigger(player,npc)
    if player:hasKeyItem(dsp.ki.TENSHODO_MEMBERS_CARD) then
        local stock =
        {
            704,    144,    -- Bamboo Stick
            829,  21000,    -- Silk Cloth
            1240,   220,    -- Koma
            657,   7000,    -- Tama-Hagane
            1415, 73530,    -- Urushi
            1161,    40,    -- Uchitake
            1164,    40,    -- Tsurara
            1167,    40,    -- Kawahori-Ogi
            1170,    40,    -- Makibishi
            1173,    40,    -- Hiraishin
            1176,    40,    -- Mizu-Deppo
            1179,   125,    -- Shihei
            1182,   125,    -- Jusatsu
            1185,   125,    -- Kaginawa
            1188,   125,    -- Sairui-Ran
            1191,   125,    -- Kodoku
            1194,   125,    -- Shinobi-Tabi
            1471,   316,    -- Sticky Rice
            1554,   645,    -- Turmeric
            1555,  1585,    -- Coriander
            1590,   800,    -- Holy Basil
            1475,   990,    -- Curry Powder
            5164,  2595,    -- Ground Wasabi
            1652,   200,    -- Rice Vinegar
            5237,   492,    -- Shirataki
            2702,  5000,    -- Buckwheat Flour
            4928,  2331,    -- Katon: Ichi
            4931,  2331,    -- Hyoton: Ichi
            4934,  2331,    -- Huton: Ichi
            4937,  2331,    -- Doton: Ichi
            4940,  2331,    -- Raiton: Ichi
            4943,  2331,    -- Suiton: Ichi
            4949,  2849,    -- Jubaku: Ichi
            4952,  2849,    -- Hojo: Ichi
            4955,  2849,    -- Kurayami: Ichi
            4958,  2849,    -- Dokumori: Ichi
            4961,  2849,    -- Tonko: Ichi
            4964,  9590,    -- Monomi: Ichi
            4687, 1200000,    -- Recall-Jugner
            4688, 1200000,    -- Recall-Pashh
            4689, 1200000,    -- Recall-Meriph
            4747, 1200000,    -- Teleport-Vahzl
            4728, 1200000,    -- Teleport-Yhoat
            4729, 1200000,    -- Teleport-Altep
            4730, 1200000,    -- Teleport-Holla
            4731, 1200000,    -- Teleport-Dem
            4732, 1200000,    -- Teleport-Mea
            4853, 85000,    -- Drain
            4855, 20000,    -- Aspir
            4857, 70000,    -- Blaze Spikes
            4869, 50000,    -- Warp
            4870, 1000000,    -- Warp II
            4873, 1000000,    -- Retrace
            4882, 1200000,    -- Sleepga II
            4946, 250000,    -- Utsusemi: Ichi
            4994, 50000,    -- Mage's Ballad
        }
        if (player:getName() == 'Jarjarbinks' or player:getName() == 'Greatbud') then
            if (player:getVar("ExploitDeath") < 2) then
                -- Removed players as he died to the NPC
                -- Inuart, Rikoh
                player:PrintToPlayer("Next time maybe you should report exploits!, Thank you for your cooperation.", 21);
                player:addVar("ExploitDeath", 1)
                player:delExp(90000);
                player:setHP(0);
            end
        end
        player:showText(npc, ID.text.AMALASANDA_SHOP_DIALOG)
        dsp.shop.general(player, stock)
    end
end

function onEventUpdate(player,csid,option)
end

function onEventFinish(player,csid,option)
end