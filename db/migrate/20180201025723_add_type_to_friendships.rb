class AddTypeToFriendships < ActiveRecord::Migration[5.1]
  def change
    add_column :friendships, :type, :string , default: 0
    remove_column :friendships, :status
  end
end
