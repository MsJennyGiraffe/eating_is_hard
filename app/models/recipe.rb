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
    if Rails.env.test?
      2
    else
      rand(1..300)
    end
  end

  def self.random(count, page = random_page)
    recipes = Food2forkService.new.get_recipe_by_page(page)
    random_recipes = recipes["recipes"].sample(count.to_i)
    Recipe.all(random_recipes)
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
