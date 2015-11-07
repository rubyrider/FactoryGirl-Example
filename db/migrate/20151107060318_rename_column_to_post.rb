class RenameColumnToPost < ActiveRecord::Migration
  def change
    rename_column :posts, :description, :contents
  end
end
