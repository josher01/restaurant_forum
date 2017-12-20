class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :restaurant
  validates_presence_of :content
end
