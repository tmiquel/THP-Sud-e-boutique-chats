class CatPicture < ApplicationRecord
	validates :title, presence: true
	validates :price, presence: true
	validate :valid_price
	has_many :cat_pic_tags
	has_many :single_cart_pics
	has_one_attached :picture_file
	

private
	def valid_price
		errors.add(:price, "Price must be a strictly positive numeric.") unless ((self.price.is_a? Numeric) && (self.price > 0))
	end

end
