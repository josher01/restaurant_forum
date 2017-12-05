class CreateRestaurants < ActiveRecord::Migration[5.1]
  def change
    create_table :restaurants do |t|
      t.integer :restaurant_id
      t.string :res_name
      t.string :res_tel
      t.string :res_opening_hours
      t.text :res_description
      t.string :res_address

      t.timestamps
    end
  end
end
