class AddUsersToInnerComents < ActiveRecord::Migration
  def change
    add_column :inner_comments, :user_id, :integer
  end
end
