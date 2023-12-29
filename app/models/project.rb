class Project < ApplicationRecord
  belongs_to :user

  has_many :likes, dependent: :destroy

  validates :likes, numericality: { only_integer: true, allow_nill: true },
                    comparison: { greater_than_or_equal_to: 0, allow_nill: true }
end
