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

  has_many :inverse_followships, class_name: "Followship", foreign_key: "following_id"
  has_many :followers, through: :inverse_followships, source: :user

  has_many :friendships, dependent: :destroy
  has_many :friend_receivers, through: :friendships

  has_many :inverse_friendships, class_name: "Friendship", foreign_key: "friend_id"
  has_many :friend_senders, through: :inverse_friendships, source: :user

  def followings?(user)
    self.followings.include?(user)
  end

  def followers?(user)
    self.followers.include?(user)
  end

  def friend_receivers?(user)
    self.friend_receivers.include?(user)
  end

  def friend_senders?(user)
    self.friend_senders.include?(user)
  end

end
