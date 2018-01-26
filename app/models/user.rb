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
  has_many :friends, through: :friendships 

  has_many :inverse_friendships, class_name: "Friendship", foreign_key: "friend_id"
  has_many :requesters, through: :inverse_friendships, source: :user

  has_many :accepted_friendships, -> {where(status: "accepted")}, class_name: "Friendship", foreign_key: "friend_id"
  has_many :accepted_friends, through: :accepted_friendships, source: :user


  has_many :rejected_friendships, -> {where(status: "rejected")}, class_name: "Friendship", foreign_key: "friend_id"
  has_many :rejected_friends, through: :rejected_friendships, source: :user

  has_many :unconfirmed_friendships, -> {where(status: "0")}, class_name: "Friendship", foreign_key: "friend_id"
  has_many :unconfirmed_friends, through: :unconfirmed_friendships, source: :user

  def followings?(user)
    self.followings.include?(user)
  end

  def followers?(user)
    self.followers.include?(user)
  end

  def friends?(user)
    self.friends.include?(user) 
  end

  def requesters?(user)
    self.requesters.include?(user)
  end

  def unconfirmed_friends?(user)
    self.unconfirmed_friends.include?(user)
  end


  def accepted_friends?(user)
    self.accepted_friends.include?(user) 
  end

  def rejected_friends?(user)
    self.rejected_friends.include?(user) 
  end

end
