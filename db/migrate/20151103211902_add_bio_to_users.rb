class AddBioToUsers < ActiveRecord::Migration
  def up
    add_column :users, :bio, :text
    add_index :users, :bio
  end

  def down
  	remove_column :users, :bio, :text
  end
end
