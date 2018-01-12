class Followship < ApplicationRecord
  belong_to :user
  belong_to :following, class_name: "User"
end
