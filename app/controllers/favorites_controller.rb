class FavoritesController < ApplicationController
  def index
    Favorite.add_favorite_recipe(params["user_id"], params["recipe_name"], params["url"], params["f2f_id"])
    redirect_to user_path(params["user_id"])
  end
end
