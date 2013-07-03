class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.integer :vimeo_id
      t.string :locale
      t.boolean :main

      t.timestamps
    end
  end
end
