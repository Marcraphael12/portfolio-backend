# frozen_string_literal: true

class CreateJobDescriptions < ActiveRecord::Migration[7.1]
  def change
    create_table :job_descriptions do |t|
      t.string :text
      t.references :experience, null: false, foreign_key: true

      t.timestamps
    end
  end
end
