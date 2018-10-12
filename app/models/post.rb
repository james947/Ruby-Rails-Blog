class Post < ApplicationRecord
  belongs_to :category
  validates :title, :subtitle, :content, :category_id, :author, presence: true
end
