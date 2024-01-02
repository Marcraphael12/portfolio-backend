class Project < ApplicationRecord
  belongs_to :user

  validates :name, :github, :live, :description, presence: true
end
