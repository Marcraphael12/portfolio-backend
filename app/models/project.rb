# frozen_string_literal: true

class Project < ApplicationRecord
  belongs_to :user

  validates :name, :github, :live, :description, :image, presence: true
end
