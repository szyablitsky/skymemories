class AddIndexToMovies < ActiveRecord::Migration
  def change
    add_column :movies, :index, :integer
  end
end
