# frozen_string_literal: true

class Post < ApplicationRecord
  belongs_to :category
  validates :title, :subtitle, :content, :category_id, :author, presence: true
  has_one_attached :image

  def thumbnail
    image.variant(resize: '400x600').processed
  end

  def banner
    image.variant(resize: '300*300').processed
  end
end
