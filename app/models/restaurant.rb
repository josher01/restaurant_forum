class Restaurant < ApplicationRecord
  validates_presence_of :res_name, :res_opening_hours, :res_tel, :res_address, :res_description
  mount_uploader :photo, PhotoUploader
  max_paginates_per 10
  belongs_to :category, optional: true
end
