class RenameInnerComentsComment < ActiveRecord::Migration
  def change
    rename_column :inner_comments, :comment, :content
  end
end
