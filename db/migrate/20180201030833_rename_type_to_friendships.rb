class RenameTypeToFriendships < ActiveRecord::Migration[5.1]
  def change
    rename_column :friendships, :type, :status
  end
end
