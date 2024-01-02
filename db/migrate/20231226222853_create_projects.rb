# frozen_string_literal: true

class CreateProjects < ActiveRecord::Migration[7.1]
  def change
    create_table :projects do |t|
      t.string :name
      t.string :github
      t.string :live
      t.string :description
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
