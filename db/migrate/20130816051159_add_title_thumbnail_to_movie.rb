class AddTitleThumbnailToMovie < ActiveRecord::Migration
  def change
    add_column :movies, :title, :string
    add_column :movies, :thumbnail, :string
  end
end
