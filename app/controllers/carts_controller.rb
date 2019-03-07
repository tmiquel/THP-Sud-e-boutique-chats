class CartsController < ApplicationController
	before_action -> { authenticate_user!( force: true ) } 

  def show
		@user = current_user
		@cart = current_user.cart
		@single_cart_pics = SingleCartPic.where(cart: @cart)
		sum = 0
		@single_cart_pics.each do |k|
			sum += k.amount * k.cat_picture.price
		end
		@total_amount = sum	
  end
end
