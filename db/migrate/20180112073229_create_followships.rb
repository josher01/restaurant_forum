class CreateFollowships < ActiveRecord::Migration[5.1]
  def change
    create_table :followships do |t|
      t.references :user, foreign_key: true
      t.references :following, foreign_key: true
      t.timestamps
    end
  end
end
