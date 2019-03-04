class CatPicTag < ApplicationRecord
	belongs_to :cat_picture
	belongs_to :tag
end
