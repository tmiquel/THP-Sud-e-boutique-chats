# frozen_string_literal: true

class CatPicture < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged
  validates :title, presence: true
  validates :price, presence: true
  validate :valid_price
  has_many :cat_pic_tags
  has_many :single_cart_pics
  has_one_attached :picture_file

  private

  def valid_price
    errors.add(:price, 'Price must be a strictly positive numeric.') unless (price.is_a? Numeric) && (price > 0)
  end
end
