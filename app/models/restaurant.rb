class Restaurant < ApplicationRecord
  validates_presence_of :res_name, :res_opening_hours, :res_tel, :res_address, :res_description, :category_id
  mount_uploader :photo, PhotoUploader
  max_paginates_per 10
  belongs_to :category
  has_many :comments, dependent: :destroy
  has_many :users, through: :comments


end
