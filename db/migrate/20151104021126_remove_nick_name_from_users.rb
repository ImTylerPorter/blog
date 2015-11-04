class RemoveNickNameFromUsers < ActiveRecord::Migration
  def self.up
    remove_column :users, :nick_name, :string
  end

  def self.down
  	add_column :users, :nick_name, :string

  end
end
