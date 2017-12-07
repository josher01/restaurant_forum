class RemoveImageFromRestaurant < ActiveRecord::Migration[5.1]
  def change
    remove_column :restaurants, :image, :string
  end
end
