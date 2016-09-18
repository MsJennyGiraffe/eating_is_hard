class RecipesController < ApplicationController
  def index
    @recipes = Recipe.random(params[:quantity])
  end
end
