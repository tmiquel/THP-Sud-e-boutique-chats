class Cart < ApplicationRecord
	belongs_to :owner, class_name: 'User'
	has_many :single_cart_pics
	has_many :purchases
end
