class Experience < ApplicationRecord
    belongs_to :user

    has_many :job_descriptions, dependent: :destroy
end
