class SingleCartPic < ApplicationRecord
	belongs_to :cart
	belongs_to :cat_picture
end
