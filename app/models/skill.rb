# frozen_string_literal: true

class Skill < ApplicationRecord
  belongs_to :user

  validates :name, presence: true
end
