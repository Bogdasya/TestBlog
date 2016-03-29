class CreateInnerComments < ActiveRecord::Migration
  def change
    create_table :inner_comments do |t|
      t.string :comment
      t.integer :comment_id
      t.timestamps null: false
    end
  end
end
