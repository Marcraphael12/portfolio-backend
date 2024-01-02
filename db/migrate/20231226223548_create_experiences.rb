# frozen_string_literal: true

class CreateExperiences < ActiveRecord::Migration[7.1]
  def change
    create_table :experiences do |t|
      t.string :position
      t.string :society
      t.string :period
      t.string :type
      t.string :logo
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
