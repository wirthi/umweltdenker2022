class AddGroupIdToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :group_id, :integer
    add_foreign_key :users, :groups
  end
end
