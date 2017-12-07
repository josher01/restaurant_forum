class Restaurant < ApplicationRecord
  validates_presence_of :res_name, :res_opening_hours, :res_tel, :res_address, :res_description
  mount_uploader :photo, PhotoUploader
end
