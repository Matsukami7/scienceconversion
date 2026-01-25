data:extend({
    -- Toggle for linear conversion scaling
    {
        type = "bool-setting",
        name = "science-conversion-linear-scaling",
        setting_type = "startup",
        default_value = true,
        order = "a"
    },
    -- Base conversion ratio for upgrading (lower tier to higher tier)
    {
        type = "int-setting",
        name = "science-conversion-upgrade-base-ratio",
        setting_type = "startup",
        default_value = 10,
        minimum_value = 1,
        maximum_value = 1000,
        order = "b"
    },
    -- Base conversion ratio for downgrading (higher tier to lower tier)
    {
        type = "int-setting",
        name = "science-conversion-downgrade-base-ratio",
        setting_type = "startup",
        default_value = 1,
        minimum_value = 1,
        maximum_value = 100,
        order = "c"
    },
    -- Product amount multiplier
    {
        type = "int-setting",
        name = "science-conversion-product-multiplier",
        setting_type = "startup",
        default_value = 1,
        minimum_value = 1,
        maximum_value = 100,
        order = "d"
    },
    -- Energy required per conversion
    {
        type = "int-setting",
        name = "science-conversion-energy-time",
        setting_type = "startup",
        default_value = 10,
        minimum_value = 1,
        maximum_value = 300,
        order = "e"
    },
    
    -- Bidirectional toggles
    {
        type = "bool-setting",
        name = "science-conversion-enable-upgrades",
        setting_type = "startup",
        default_value = true,
        order = "e-a"
    },
    {
        type = "bool-setting",
        name = "science-conversion-enable-downgrades",
        setting_type = "startup",
        default_value = true,
        order = "e-b"
    },
    
    -- Tier-specific toggles
    {
        type = "bool-setting",
        name = "science-conversion-enable-tier-1",
        setting_type = "startup",
        default_value = true,
        order = "f-a"
    },
    {
        type = "bool-setting",
        name = "science-conversion-enable-tier-2",
        setting_type = "startup",
        default_value = true,
        order = "f-b"
    },
    {
        type = "bool-setting",
        name = "science-conversion-enable-tier-3",
        setting_type = "startup",
        default_value = true,
        order = "f-c"
    },
    {
        type = "bool-setting",
        name = "science-conversion-enable-tier-4",
        setting_type = "startup",
        default_value = true,
        order = "f-d"
    },
    {
        type = "bool-setting",
        name = "science-conversion-enable-tier-5",
        setting_type = "startup",
        default_value = true,
        order = "f-e"
    },
    {
        type = "bool-setting",
        name = "science-conversion-enable-tier-6",
        setting_type = "startup",
        default_value = true,
        order = "f-f"
    },
    {
        type = "bool-setting",
        name = "science-conversion-enable-tier-7",
        setting_type = "startup",
        default_value = true,
        order = "f-g"
    },
    {
        type = "bool-setting",
        name = "science-conversion-enable-tier-8",
        setting_type = "startup",
        default_value = true,
        order = "f-h"
    },
    {
        type = "bool-setting",
        name = "science-conversion-enable-tier-9",
        setting_type = "startup",
        default_value = true,
        order = "f-i"
    }
})
