class UpdateStatusToFriendships < ActiveRecord::Migration[5.1]
  def change
    change_column :friendships, :status, :string , default: 0, :null => false
  end
end
