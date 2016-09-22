class Recipe
  attr_reader :title,
              :source_url,
              :f2f_url,
              :recipe_id,
              :image_url,
              :recommended

  def initialize(title, source_url, f2f_url,recipe_id, image_url, recommended)
    @title       = title
    @source_url  = source_url
    @f2f_url     = f2f_url
    @recipe_id   = recipe_id
    @image_url   = image_url
    @recommended = recommended
  end

  def self.random_page
    return 2 if Rails.env.test?
    rand(1..300)
  end

  def self.random(count, page = random_page)
    recipes = Food2forkService.new.get_recipe_by_page(page)
    random_recipes = recipes["recipes"].sample(count.to_i)
    Recipe.all(random_recipes)
  end

  def self.user_likes(liked_ingredients, quantity)
    ingredient = liked_ingredients.sample.ingredient.name
    ingredient_recipe = Food2forkService.new.get_liked_food_recipe(ingredient)
    if (quantity.to_i - 1) > 0
      recipes = Recipe.random(quantity.to_i - 1)
      recipe = [ingredient_recipe.sample]
      recipe = Recipe.all(recipe, ingredient)
      recipes << recipe.first
    else
      recipe = [ingredient_recipe.sample]
      Recipe.all(recipe, ingredient)
    end
  end

  def self.all(recipes, ingredient = nil)
    recipes.map do |recipe|
      Recipe.new(
        recipe["title"],
        recipe["source_url"],
        recipe["f2f_url"],
        recipe["recipe_id"],
        recipe["image_url"],
        ingredient
      )
    end
  end
end
