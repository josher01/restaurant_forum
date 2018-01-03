class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :restaurant
  validates_presence_of :content
  has_many :likes, :as => :likeable
  has_many :likers, through: :likes, source: :user
end
