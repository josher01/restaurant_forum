class AddStatusToFriendships < ActiveRecord::Migration[5.1]
  def change
    add_column :friendships, :status, :boolean , default: 0, :null => false
  end
end
