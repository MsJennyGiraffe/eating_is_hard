require 'rails_helper'

describe Like do
  context "add_ingredient" do
    it "adds an ingredient to a users dislikes" do
      user = User.create(name: "Barry")
      ingredient = Ingredient.create(name: "Berry")

      like = Dislike.add_ingredient(user.id, ingredient.id)

      expect(like.user).to eq(user)
      expect(like.ingredient).to eq(ingredient)
    end
  end
end
