class Post < ApplicationRecord
  default_scope {order(created_at: :desc)}
  belongs_to :user
  has_one_attached :image
end
