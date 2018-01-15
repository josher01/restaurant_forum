class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def admin?
    self.role == 'admin'
  end

  has_many :comments, dependent: :destroy
  mount_uploader :avatar, AvatarUploader

  has_many :restaurants, through: :comments

  has_many :favorites, dependent: :destroy
  has_many :favorited_restaurants, through: :favorites , source: :restaurant
  has_many :liked_restaurants, through: :likes, source: :likeable, source_type: "Restaurant"
  has_many :liked_comments, through: :likes, source: :likeable, source_type: "Comment"

  has_many :followships, dependent: :destroy
  has_many :followings, through: :followships

  def followings?(user)
    self.followings.include?(user)
  end

end
