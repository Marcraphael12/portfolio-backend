# frozen_string_literal: true

class CreateVideos < ActiveRecord::Migration[7.1]
  def change
    create_table :videos do |t|
      t.string :title
      t.string :link
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
