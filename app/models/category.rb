class Category < ApplicationRecord
  has_many :restaurants, dependent: :restrict_with_error
  validates_presence_of :name


end
