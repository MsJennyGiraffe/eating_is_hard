require 'rails_helper'

describe Dislike do
  context "add_ingredient" do
    it "adds an ingredient to a users dislikes" do
      user = User.create(name: "Francis")
      ingredient = Ingredient.create(name: "Duck")

      dislike = Dislike.add_ingredient(user.id, ingredient.id)

      expect(dislike.user).to eq(user)
      expect(dislike.ingredient).to eq(ingredient)
    end
  end
end
