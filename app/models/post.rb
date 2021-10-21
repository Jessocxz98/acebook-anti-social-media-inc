class Post < ApplicationRecord
  default_scope {order(created_at: :desc)}
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_one_attached :image, dependent: :destroy
  has_many :likes, dependent: :destroy
end
