class User < ApplicationRecord
  def self.from_omniauth(auth_info)
    where(uid: auth_info[:uid]).first_or_create do |new_user|
      new_user.name  = auth_info.info.name
      new_user.email = auth_info.info.email
      new_user.image = auth_info.info.image
    end
  end
end
