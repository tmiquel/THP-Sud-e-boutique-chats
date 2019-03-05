class SingleCartPic < ApplicationRecord
	belongs_to :cart
	belongs_to :cat_picture
	validate :no_single_cart_pic_ducplicata

private
  def no_single_cart_pic_duplicata
    SingleCartPic.all.each do |single_cart_pic|
      errors.add(:cat_picture, "The same tag can't be applied twice to the same pic") if ((single_cart_pic.cat_picture == self.cat_picture)&&(single_cart_pic.cart == self.cart))
    end
  end

end
