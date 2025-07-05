data:extend({
    {
      type = "recipe",
      name = "green-to-red",
      energy_required = 10,
      enabled = false,
      ingredients = {
        {type = "item", name = "logistic-science-pack", amount = 1}
      },
      results = {
        {type = "item", name = "automation-science-pack", amount = 1}
      }
    },
    { 
      type = "recipe",
      name = "red-to-green",
      energy_required = 10,
      enabled = false,
     ingredients = {
            {type = "item", name = "automation-science-pack", amount = 10}
        },
        results = {
            {type = "item", name = "logistic-science-pack", amount = 1}
        }
    },
    {
      type = "recipe",
      name = "green-to-blue",
      energy_required = 10,
      enabled = false,
      ingredients = {
        {type = "item", name = "logistic-science-pack", amount = 20}
      },
      results = {
        {type = "item", name = "chemical-science-pack", amount = 1}
      }
    },
    {
      type = "recipe",
      name = "blue-to-green",
      energy_required = 10,
      enabled = false,
      ingredients = {
        {type = "item", name = "chemical-science-pack", amount = 1}
      },
      results = {
        {type = "item", name = "logistic-science-pack", amount = 1}
      }
    },
    {
      type = "recipe",
      name = "blue-to-purple",
      energy_required = 10,
      enabled = false,
      ingredients = {
        {type = "item", name = "chemical-science-pack", amount = 100}
      },
      results = {
        {type = "item", name = "production-science-pack", amount = 1}
      }
    },
    {
      type = "recipe",
      name = "purple-to-blue",
      energy_required = 10,
      enabled = false,
      ingredients = {
        {type = "item", name = "production-science-pack", amount = 1}
      },
      results = {
        {type = "item", name = "chemical-science-pack", amount = 1}
      }
    },
    {
      type = "recipe",
      name = "purple-to-yellow",
      energy_required = 10,
      enabled = false,
      ingredients = {
        {type = "item", name = "production-science-pack", amount = 150}
      },
      results = {
        {type = "item", name = "utility-science-pack", amount = 1}
      }
    },
    {
      type = "recipe",
      name = "yellow-to-purple",
      energy_required = 10,
      enabled = false,
      ingredients = {
        {type = "item", name = "utility-science-pack", amount = 1}
      },
      results = {
        {type = "item", name = "production-science-pack", amount = 1}
      }
    },
    {
      type = "recipe",
      name = "white-to-orange",
      energy_required = 10,
      enabled = false,
      ingredients = {
        {type = "item", name = "space-science-pack", amount = 100}
      },
      results = {
        {type = "item", name = "metallurgic-science-pack", amount = 1}
      }
    },
    {
      type = "recipe",
      name = "orange-to-white",
      energy_required = 10,
      enabled = false,
      ingredients = {
        {type = "item", name = "metallurgic-science-pack", amount = 1}
      },
      results = {
        {type = "item", name = "space-science-pack", amount = 1}
      }
    }
})