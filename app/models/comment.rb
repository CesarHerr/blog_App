class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: :user_id
  belongs_to :post, foreign_key: :post_id

  validates :text, presence: true, length: { maximum: 1000 }

  after_create :update_counter_posts
  before_destroy :remove_counter_posts

  def update_counter_posts
    post.update(comments_count: post.comments_count + 1)
  end

  def remove_counter_posts
    post.update(comments_count: post.comments_count - 1)
  end
end
