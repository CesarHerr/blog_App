class Like < ApplicationRecord
  belongs_to :post, foreign_key: :post_id
  belongs_to :author, class_name: 'User', foreign_key: :user_id
end
