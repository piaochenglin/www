class ChangeForComments < ActiveRecord::Migration[5.1]
  def change
    rename_column :comments, :commernter, :commenter
  end
end
