# This class represents articles and their association with users
class Article < ApplicationRecord
  belongs_to :user

  validates :title, presence: true, length: { minimum: 5 }
  validates :description, presence: true
end
