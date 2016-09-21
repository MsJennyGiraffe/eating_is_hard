class Recipe
  attr_reader :title, :source_url, :f2f_url, :recipe_id, :image_url

  def initialize(title, source_url, f2f_url,recipe_id, image_url)
    @title = title
    @source_url = source_url
    @f2f_url = f2f_url
    @recipe_id = recipe_id
    @image_url = image_url
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
      recipes << ingredient_recipe
    else
      recipes = [ingredient_recipe.sample]
    end
    Recipe.all(recipes)
  end

  def self.all(recipes)
    recipes.map do |recipe|
      Recipe.new(
        recipe["title"],
        recipe["source_url"],
        recipe["f2f_url"],
        recipe["recipe_id"],
        recipe["image_url"]
      )
    end
  end
end
