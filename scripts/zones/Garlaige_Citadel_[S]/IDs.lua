-----------------------------------
-- Area: Garlaige_Citadel_[S]
-----------------------------------
require("scripts/globals/zone")
-----------------------------------

zones = zones or {}

zones[dsp.zone.GARLAIGE_CITADEL_S] =
{
    text =
    {
        ITEM_CANNOT_BE_OBTAINED = 6382, -- You cannot obtain the <item>. Come back after sorting your inventory.
        ITEM_OBTAINED           = 6388, -- Obtained: <item>.
        GIL_OBTAINED            = 6389, -- Obtained <number> gil.
        KEYITEM_OBTAINED        = 6391, -- Obtained key item: <keyitem>.
        BAYLD_OBTAINED          = 7005, -- You have obtained <number> bayld!
    },
    mob =
    {
    },
    npc =
    {
    },
}

return zones[dsp.zone.GARLAIGE_CITADEL_S]