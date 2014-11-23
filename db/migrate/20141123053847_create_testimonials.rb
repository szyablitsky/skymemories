class CreateTestimonials < ActiveRecord::Migration
  def change
    create_table :testimonials do |t|
      t.references :movie, index: true
      t.text :body
      t.string :author
    end
  end
end
