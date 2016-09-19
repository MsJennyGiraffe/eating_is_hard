class PreferencesController < ApplicationController
  def index
    @ingredients = Ingredient.all
    @user = User.find(current_user.id)
    Like.add_ingredient(params[:user_id], params[:ingredient]) if params[:ingredient]
  end
end
