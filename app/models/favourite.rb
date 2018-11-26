class Favourite < ApplicationRecord
  belongs_to :user, required: true
  belongs_to :favourite_user, class_name: "User", foreign_key: "favourite_user_id", required: true

end
