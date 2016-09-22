class User < ApplicationRecord
  has_many :likes
  has_many :ingredients, through: :likes
  has_many :dislikes
  has_many :ingredients, through: :dislikes
  has_many :favorites
  has_many :saved_recipes, through: :favorites

  def self.from_omniauth(auth_info)
    where(uid: auth_info[:uid]).first_or_create do |new_user|
      new_user.name  = auth_info.info.name
      new_user.email = auth_info.info.email
      new_user.image = auth_info.info.image
    end
  end
end
