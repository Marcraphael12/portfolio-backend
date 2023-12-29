class Like < ApplicationRecord
  belongs_to :project
  belongs_to :article
  after_save :update_likes_counter

  def update_likes_counter
    project.increment!(:likes_counter)
  end
end
