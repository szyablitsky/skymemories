class AddVimeoIdUniqToMovies < ActiveRecord::Migration
  def change
    add_index :movies, :vimeo_id, unique: true
  end
end
