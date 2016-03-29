class AddUsers < ActiveRecord::Migration
  def change
    remove_column :comments, :author
    add_column :comments, :user_id, :integer
    add_foreign_key :comments, :users
  end
end
