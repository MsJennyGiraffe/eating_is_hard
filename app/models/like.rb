class Like < ApplicationRecord
  belongs_to :user
  belongs_to :ingredient

  def self.add_ingredient(user_id, ingredient_id)
    Like.create(user_id: user_id, ingredient_id: ingredient_id)
  end
end
