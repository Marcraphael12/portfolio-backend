# frozen_string_literal: true

class User < ApplicationRecord
  has_many :experiences, dependent: :destroy
  has_many :videos, dependent: :destroy
  has_many :skills, dependent: :destroy
  has_many :projects, dependent: :destroy
  has_many :articles, dependent: :destroy
  has_many :testimonials, dependent: :destroy
end
