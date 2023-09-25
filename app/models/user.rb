class User < ApplicationRecord
  has_many :comments
  has_many :posts
  has_many :likes

  validates :name, presence: true
  validates :posts_count, numericality: { greater_than_or_equal_to: 0 }

  def return_recent_post
    posts.order(created_at: :desc).limit(3)
  end
end
