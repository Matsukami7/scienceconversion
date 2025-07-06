data:extend({
    {
        type = "technology",
        name = "science-conversion-one",
        icon = "__ScienceConversion__/graphics/green-red-science.png",
        icon_size = 128,
        effects =
        {   
          {
              type = "unlock-recipe",
              recipe = "green-to-red"
          },     		
          {
              type = "unlock-recipe",
              recipe = "red-to-green"
          }
        },
        prerequisites = {"logistic-science-pack"},
        unit =
        {
          count = 50,
          ingredients =
          {
            {"automation-science-pack", 1},
            {"logistic-science-pack", 1},
          },
          time = 15
        }
    },
    {
      type = "technology",
      name = "science-conversion-two",
      icon = "__ScienceConversion__/graphics/blue-green-science.png",
      icon_size = 128,
      effects =
      {   
        {
            type = "unlock-recipe",
            recipe = "green-to-blue"
        },     		
        {
            type = "unlock-recipe",
            recipe = "blue-to-green"
        }
      },
      prerequisites = {"chemical-science-pack", "science-conversion-one"},
      unit =
      {
        count = 100,
        ingredients =
        {
          {"automation-science-pack", 1},
          {"logistic-science-pack", 1},
        },
        time = 15
      }
  },
  {
    type = "technology",
    name = "science-conversion-three",
    icon = "__ScienceConversion__/graphics/purple-blue-conversion.png",
    icon_size = 128,
    effects =
    {   
      {
          type = "unlock-recipe",
          recipe = "blue-to-purple"
      },     		
      {
          type = "unlock-recipe",
          recipe = "purple-to-blue"
      }
    },
    prerequisites = {"production-science-pack", "science-conversion-two"},
    unit =
    {
      count = 200,
      ingredients =
      {
        {"chemical-science-pack", 1},
        {"logistic-science-pack", 1},
      },
      time = 20
    }
  },
  {
    type = "technology",
    name = "science-conversion-four",
    icon = "__ScienceConversion__/graphics/purple_yellow_exchange.png",
    icon_size = 128,
    effects =
    {   
      {
          type = "unlock-recipe",
          recipe = "purple-to-yellow"
      },     		
      {
          type = "unlock-recipe",
          recipe = "yellow-to-purple"
      }
    },
    prerequisites = {"production-science-pack", "utility-science-pack", "science-conversion-three"},
    unit =
    {
      count = 400,
      ingredients =
      {
        {"production-science-pack", 1},
        {"utility-science-pack", 1},
      },
      time = 30
    }
},
{
  type = "technology",
  name = "science-conversion-five",
  icon = "__ScienceConversion__/graphics/white_to_orange_exchange.png",
  icon_size = 128,
  effects =
  {   
    {
        type = "unlock-recipe",
        recipe = "white-to-orange"
    },
    {
        type = "unlock-recipe",
        recipe = "orange-to-white"
    }        
  },
  prerequisites = {"space-science-pack", "science-conversion-four"},
  unit =
  {
    count = 500,
    ingredients =
    {
      {"production-science-pack", 1},
      {"utility-science-pack", 1},
      {"chemical-science-pack", 1},
      {"logistic-science-pack", 1},
      {"automation-science-pack", 1},
      {"space-science-pack", 1}
    },
    time = 30
  }
},
{
  type = "technology",
  name = "science-conversion-six",
  icon = "__ScienceConversion__/graphics/white_to_pink_exchange.png",
  icon_size = 128,
  effects =
  {   
    {
        type = "unlock-recipe",
        recipe = "white-to-pink"
    },
    {
        type = "unlock-recipe",
        recipe = "pink-to-white"
    }        
  },
  prerequisites = {"space-science-pack", "science-conversion-four"},
  unit =
  {
    count = 500,
    ingredients =
    {
      {"production-science-pack", 1},
      {"utility-science-pack", 1},
      {"chemical-science-pack", 1},
      {"logistic-science-pack", 1},
      {"automation-science-pack", 1},
      {"space-science-pack", 1}
    },
    time = 30
  }
}
  })