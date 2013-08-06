class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.text :body
      t.boolean :published
      t.integer :user_id

      t.timestamps
    end
    add_index :posts, :title, unique: true
  end
end
