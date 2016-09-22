class RecipesController < ApplicationController
  def index
    if current_user && current_user.likes && params[:quantity]
      @recipes = Recipe.user_likes(current_user.likes, params[:quantity])
    else
      @recipes = Recipe.random(params[:quantity])
    end
  end
end
