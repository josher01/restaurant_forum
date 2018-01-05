class AddFavoritecountToRestaurants < ActiveRecord::Migration[5.1]
  def change
    add_column :restaurants, :favorite_count, :integer
  end
end
