# frozen_string_literal: true

class Testimonial < ApplicationRecord
  belongs_to :user

  validations :name, :message, :photo, presence: true
end
