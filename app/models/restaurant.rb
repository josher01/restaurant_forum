class Restaurant < ApplicationRecord
  validates_presence_of :res_name, :res_opening_hours, :res_tel, :res_address, :res_description, :category_id
  mount_uploader :photo, PhotoUploader
  max_paginates_per 10
  belongs_to :category
  has_many :comments, dependent: :destroy
  has_many :users, through: :comments

  has_many :favorites, dependent: :destroy
  has_many :favorited_users, through: :favorites , source: :user
  has_many :likes, as: :likeable
  has_many :likers, through: :likes, source: :user

  def is_favorited?(user)
    self.favorited_users.include?(user)
  end

  def is_liked?(user)
    self.likers.include?(user)
  end
end
