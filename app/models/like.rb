class Like < ApplicationRecord
  belongs_to :post, foreign_key: :post_id
  belongs_to :author, class_name: 'User', foreign_key: :user_id

  after_create :update_likes_counter

  def update_likes_counter
    post.update(likes_count: post.likes_count + 1)
  end
end
