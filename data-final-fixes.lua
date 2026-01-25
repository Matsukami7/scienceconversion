-- This file runs in the settings-final-fixes phase to update recipes based on mod settings

-- Get setting values
local linear_scaling = settings.startup["science-conversion-linear-scaling"].value
local upgrade_base = settings.startup["science-conversion-upgrade-base-ratio"].value
local downgrade_base = settings.startup["science-conversion-downgrade-base-ratio"].value
local product_mult = settings.startup["science-conversion-product-multiplier"].value
local energy_time = settings.startup["science-conversion-energy-time"].value
local pollution_mult = settings.startup["science-conversion-pollution-multiplier"].value

-- Get bidirectional toggle settings
local upgrades_enabled = settings.startup["science-conversion-enable-upgrades"].value
local downgrades_enabled = settings.startup["science-conversion-enable-downgrades"].value

-- Get tier enable/disable settings
local tier_enabled = {
    [1] = settings.startup["science-conversion-enable-tier-1"].value,  -- Red <-> Green
    [2] = settings.startup["science-conversion-enable-tier-2"].value,  -- Green <-> Blue
    [3] = settings.startup["science-conversion-enable-tier-3"].value,  -- Blue <-> Purple
    [4] = settings.startup["science-conversion-enable-tier-4"].value,  -- Purple <-> Yellow
    [5] = settings.startup["science-conversion-enable-tier-5"].value,  -- White <-> Orange
    [6] = settings.startup["science-conversion-enable-tier-6"].value,  -- White <-> Pink
    [7] = settings.startup["science-conversion-enable-tier-7"].value,  -- White <-> Lime
    [8] = settings.startup["science-conversion-enable-tier-8"].value,  -- White <-> Dark Blue
    [9] = settings.startup["science-conversion-enable-tier-9"].value   -- White <-> Black
}

-- Define the science tier hierarchy and their multipliers for linear scaling
-- Tier 1: Red (automation), Tier 2: Green (logistic), Tier 3: Blue (chemical)
-- Tier 4: Purple (production), Tier 5: Yellow (utility), Tier 6: White (space)
-- Tier 7: Orange/Pink/Lime/Dark-blue (planet sciences), Tier 8: Black (promethium)

local conversion_data = {
    -- Format: {recipe_name, tier_difference, is_upgrade, tier_number, technology_name}
    -- Tier 1: Red <-> Green
    {"red-to-green", 1, true, 1, "science-conversion-one"},
    {"green-to-red", 1, false, 1, "science-conversion-one"},
    
    -- Tier 2: Green <-> Blue
    {"green-to-blue", 1, true, 2, "science-conversion-two"},
    {"blue-to-green", 1, false, 2, "science-conversion-two"},
    
    -- Tier 3: Blue <-> Purple
    {"blue-to-purple", 1, true, 3, "science-conversion-three"},
    {"purple-to-blue", 1, false, 3, "science-conversion-three"},
    
    -- Tier 4: Purple <-> Yellow
    {"purple-to-yellow", 1, true, 4, "science-conversion-four"},
    {"yellow-to-purple", 1, false, 4, "science-conversion-four"},
    
    -- Tier 5: White <-> Orange
    {"white-to-orange", 1, true, 5, "science-conversion-five"},
    {"orange-to-white", 1, false, 5, "science-conversion-five"},
    
    -- Tier 6: White <-> Pink
    {"white-to-pink", 1, true, 6, "science-conversion-six"},
    {"pink-to-white", 1, false, 6, "science-conversion-six"},
    
    -- Tier 7: White <-> Lime
    {"white-to-lime", 1, true, 7, "science-conversion-seven"},
    {"lime-to-white", 1, false, 7, "science-conversion-seven"},
    
    -- Tier 8: White <-> Dark Blue
    {"white-to-dark-blue", 1, true, 8, "science-conversion-eight"},
    {"dark-blue-to-white", 1, false, 8, "science-conversion-eight"},
    
    -- Tier 9: White <-> Black
    {"white-to-black", 2, true, 9, "science-conversion-nine"},
    {"black-to-white", 2, false, 9, "science-conversion-nine"}
}

-- Function to calculate ingredient amount based on settings
local function calculate_ingredient_amount(tier_diff, is_upgrade)
    if is_upgrade then
        if linear_scaling then
            -- Linear scaling: multiply base by tier difference and a scaling factor
            -- Original: 10, 20, 30, 50, 100 (roughly 10 * tier_position)
            -- We'll use tier_diff to scale: tier 1->2 = 10, 2->3 = 20, 3->4 = 30, etc.
            local scale_factor = tier_diff
            if tier_diff == 2 then
                scale_factor = 10 -- For white-to-black (special case, was 100)
            end
            return upgrade_base * scale_factor
        else
            -- Uniform: same ratio for all upgrades
            return upgrade_base
        end
    else
        -- Downgrade always uses the downgrade base ratio
        return downgrade_base
    end
end

-- Update all conversion recipes
for _, conversion in pairs(conversion_data) do
    local recipe_name = conversion[1]
    local tier_diff = conversion[2]
    local is_upgrade = conversion[3]
    local tier_number = conversion[4]
    local tech_name = conversion[5]
    
    local recipe = data.raw.recipe[recipe_name]
    local technology = data.raw.technology[tech_name]
    
    -- Check if this tier is enabled AND if the direction (upgrade/downgrade) is enabled
    local direction_enabled = (is_upgrade and upgrades_enabled) or (not is_upgrade and downgrades_enabled)
    local should_enable = tier_enabled[tier_number] and direction_enabled
    
    if should_enable then
        -- Tier and direction are enabled - update recipe with settings
        if recipe then
            -- Calculate ingredient amount
            local ingredient_amount = calculate_ingredient_amount(tier_diff, is_upgrade)
            
            -- Update recipe
            recipe.energy_required = energy_time
            recipe.ingredients = {
                {type = "item", name = recipe.ingredients[1].name, amount = ingredient_amount}
            }
            recipe.results = {
                {type = "item", name = recipe.results[1].name, amount = product_mult}
            }
            
            -- Set pollution multiplier (0 = no pollution, 1 = normal, >1 = more pollution)
            if pollution_mult > 0 then
                recipe.emissions_multiplier = pollution_mult
            else
                -- Setting to 0 means no pollution
                recipe.emissions_multiplier = 0
            end
        end
    else
        -- Tier or direction is disabled - disable the recipe and remove from technology
        if recipe then
            recipe.enabled = false
            recipe.hidden = true
        end
        
        -- Remove recipe unlock from technology
        if technology and technology.effects then
            local new_effects = {}
            for _, effect in pairs(technology.effects) do
                if not (effect.type == "unlock-recipe" and effect.recipe == recipe_name) then
                    table.insert(new_effects, effect)
                end
            end
            technology.effects = new_effects
            
            -- If technology has no effects left, hide it
            if #technology.effects == 0 then
                technology.hidden = true
                technology.enabled = false
            end
        end
    end
end

-- Special handling for linear scaling with more granular tier differences
if linear_scaling then
    -- Adjust specific recipes to match original progression
    local special_scaling = {
        ["red-to-green"] = {scale = 1, tier = 1},    -- 10 * 1 = 10
        ["green-to-blue"] = {scale = 2, tier = 2},   -- 10 * 2 = 20
        ["blue-to-purple"] = {scale = 3, tier = 3},  -- 10 * 3 = 30
        ["purple-to-yellow"] = {scale = 5, tier = 4}, -- 10 * 5 = 50
        ["white-to-orange"] = {scale = 10, tier = 5}, -- 10 * 10 = 100
        ["white-to-pink"] = {scale = 10, tier = 6},
        ["white-to-lime"] = {scale = 10, tier = 7},
        ["white-to-dark-blue"] = {scale = 10, tier = 8},
        ["white-to-black"] = {scale = 10, tier = 9}
    }
    
    for recipe_name, scaling_data in pairs(special_scaling) do
        -- Only apply if tier is enabled
        if tier_enabled[scaling_data.tier] then
            local recipe = data.raw.recipe[recipe_name]
            if recipe and not recipe.hidden then
                recipe.ingredients = {
                    {type = "item", name = recipe.ingredients[1].name, amount = upgrade_base * scaling_data.scale}
                }
            end
        end
    end
end
