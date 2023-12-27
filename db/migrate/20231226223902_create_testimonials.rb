class CreateTestimonials < ActiveRecord::Migration[7.1]
  def change
    create_table :testimonials do |t|
      t.string :name
      t.string :message
      t.string :photo
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
