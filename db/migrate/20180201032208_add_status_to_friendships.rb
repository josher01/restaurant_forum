class AddStatusToFriendships < ActiveRecord::Migration[5.1]
  def change
    add_column :friendships, :status, :string , default: 0
  end
end
