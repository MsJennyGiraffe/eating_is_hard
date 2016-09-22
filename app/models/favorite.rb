class Favorite < ApplicationRecord
  belongs_to :saved_recipe
  belongs_to :user

  def self.add_favorite_recipe(user_id, recipe_name, url, f2f_id)
    recipe = SavedRecipe.create(
      url: url,
      name: recipe_name,
      f2f_id: f2f_id
    )
    Favorite.create(
      user_id: user_id.to_i,
      saved_recipe_id: recipe.id
    )
  end
end
