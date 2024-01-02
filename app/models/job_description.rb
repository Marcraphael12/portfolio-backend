# frozen_string_literal: true

class JobDescription < ApplicationRecord
  belongs_to :experience
  vaildates :text, presence: true
end
