-- This file runs in the settings-final-fixes phase to update recipes based on mod settings

-- Get setting values
local linear_scaling = settings.startup["science-conversion-linear-scaling"].value
local upgrade_base = settings.startup["science-conversion-upgrade-base-ratio"].value
local downgrade_base = settings.startup["science-conversion-downgrade-base-ratio"].value
local product_mult = settings.startup["science-conversion-product-multiplier"].value
local energy_time = settings.startup["science-conversion-energy-time"].value

-- Define the science tier hierarchy and their multipliers for linear scaling
-- Tier 1: Red (automation), Tier 2: Green (logistic), Tier 3: Blue (chemical)
-- Tier 4: Purple (production), Tier 5: Yellow (utility), Tier 6: White (space)
-- Tier 7: Orange/Pink/Lime/Dark-blue (planet sciences), Tier 8: Black (promethium)

local conversion_data = {
    -- Format: {recipe_name, tier_difference, is_upgrade}
    -- Tier 1 <-> Tier 2
    {"red-to-green", 1, true},
    {"green-to-red", 1, false},
    
    -- Tier 2 <-> Tier 3
    {"green-to-blue", 1, true},
    {"blue-to-green", 1, false},
    
    -- Tier 3 <-> Tier 4
    {"blue-to-purple", 1, true},
    {"purple-to-blue", 1, false},
    
    -- Tier 4 <-> Tier 5
    {"purple-to-yellow", 1, true},
    {"yellow-to-purple", 1, false},
    
    -- Tier 6 <-> Tier 7 (space to planet sciences)
    {"white-to-orange", 1, true},
    {"orange-to-white", 1, false},
    {"white-to-pink", 1, true},
    {"pink-to-white", 1, false},
    {"white-to-lime", 1, true},
    {"lime-to-white", 1, false},
    {"white-to-dark-blue", 1, true},
    {"dark-blue-to-white", 1, false},
    
    -- Tier 6 <-> Tier 8 (space to promethium)
    {"white-to-black", 2, true},
    {"black-to-white", 2, false}
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
    
    local recipe = data.raw.recipe[recipe_name]
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
    end
end

-- Special handling for linear scaling with more granular tier differences
if linear_scaling then
    -- Adjust specific recipes to match original progression
    local special_scaling = {
        ["red-to-green"] = 1,    -- 10 * 1 = 10
        ["green-to-blue"] = 2,   -- 10 * 2 = 20
        ["blue-to-purple"] = 3,  -- 10 * 3 = 30
        ["purple-to-yellow"] = 5, -- 10 * 5 = 50
        ["white-to-orange"] = 10, -- 10 * 10 = 100
        ["white-to-pink"] = 10,
        ["white-to-lime"] = 10,
        ["white-to-dark-blue"] = 10,
        ["white-to-black"] = 10
    }
    
    for recipe_name, scale in pairs(special_scaling) do
        local recipe = data.raw.recipe[recipe_name]
        if recipe then
            recipe.ingredients = {
                {type = "item", name = recipe.ingredients[1].name, amount = upgrade_base * scale}
            }
        end
    end
end
