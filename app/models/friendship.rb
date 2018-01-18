class Friendship < ApplicationRecord
  belongs_to :user
  belongs_to :add_friends, class_name: "User"
end
