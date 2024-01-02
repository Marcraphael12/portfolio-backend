# frozen_string_literal: true

class Experience < ApplicationRecord
  belongs_to :user

  has_many :job_descriptions, dependent: :destroy

  validates :position, :society, :period, :type, :logo, presence: true
end
