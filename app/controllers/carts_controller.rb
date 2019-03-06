class CartsController < ApplicationController
  def show
		@single_cart_pics = SingleCartPic.all
  end
end
