class RemoveCreateFromFriendships < ActiveRecord::Migration[5.2]
  def change
    remove_column :friendships, :create, :string
  end
end