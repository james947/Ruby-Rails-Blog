class Post < ApplicationRecord
  belongs_to :category
  validates :title, :subtitle, :content, :category_id, :author, presence: true
  has_one_attached :image
end
