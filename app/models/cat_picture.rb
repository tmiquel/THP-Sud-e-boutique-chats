class CatPicture < ApplicationRecord
	has_one_attached :cat_pic
	#validates :title, presence: true
	#validates :price, presence: true
	#validate :valid_price
	has_many :cat_pic_tags
	has_many :single_cart_pics

private
	def valid_price
		errors.add(:price, "Price must be a strictly positive numeric.") unless ((self.price.is_a? Numeric) && (self.price > 0))
	end

end
