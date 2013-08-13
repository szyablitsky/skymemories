class RenameBodyToContentInPosts < ActiveRecord::Migration
  def change
    rename_column :posts, :body, :content
  end
end
