class Post < ApplicationRecord
  has_many :comments
  has_many :likes
  belongs_to :author, class_name: 'User', foreign_key: :author_id

  validates :title, presence: true, length: { maximum: 250 }
  validates :comments_count, numericality: { greater_than_or_equal_to: 0 }
  validates :likes_count, numericality: { greater_than_or_equal_to: 0 }

  after_create :add_post_counter
  after_destroy :remove_post_counter

  def add_post_counter
    author.update(posts_count: author.posts_count + 1)
  end

  def remove_post_counter
    author.update(posts_count: author.posts_count - 1)
  end

  def return_recent_comments
    comments.order(created_at: :desc).limit(5)
  end

end
