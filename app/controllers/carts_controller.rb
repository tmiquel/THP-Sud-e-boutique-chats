class CartsController < ApplicationController
  def show
		@single_cart_pics = SingleCartPic.all
		sum = 0
		@single_cart_pics.each do |k|
			sum += k.amount * k.cat_picture.price
		end
		@total_amount = sum	
  end
end
