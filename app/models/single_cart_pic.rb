# frozen_string_literal: true

class SingleCartPic < ApplicationRecord
  belongs_to :cart
  belongs_to :cat_picture
  validate :no_single_cart_pic_duplicata
  validates :amount, presence: true
  validate :valid_amount

  private

  def valid_amount
    errors.add(:amount, message: 'Amount must be a strictly positive integer') unless (amount.is_a? Integer) && (amount > 0)
  end

  def no_single_cart_pic_duplicata
    SingleCartPic.all.each do |single_cart_pic|
      errors.add(:cat_picture, "The same tag can't be applied twice to the same pic") if ((single_cart_pic.cat_picture == cat_picture) && (single_cart_pic.cart == cart)) && (single_cart_pic != self)
    end
  end
end
