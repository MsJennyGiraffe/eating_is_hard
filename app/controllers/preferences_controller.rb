class PreferencesController < ApplicationController
  def index
    @ingredients = Ingredient.all
    @user = User.find(current_user.id)
    if params[:ingredient] && params[:like] == "true"
      if Like.find_by(user_id: current_user.id, ingredient_id: params[:ingredient]).nil?
        Like.add_ingredient(params[:user_id], params[:ingredient])
      else
        flash[:warning] = "You've already liked this ingredient"
      end
    elsif params[:ingredient] && params[:like] == "false"
      if Dislike.find_by(user_id: current_user.id, ingredient_id: params[:ingredient]).nil?
        Dislike.add_ingredient(params[:user_id], params[:ingredient])
      else
        flash[:warning] = "You've already disliked this ingredient"
      end
    end
  end
end
