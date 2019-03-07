class CartsController < ApplicationController

	before_action :set_user_cart, only: %i[show]
	before_action :authenticate_user!
	before_action :access_my_cart_only, only: %i[show]

  def show
		@user_id = User.find(params[:user_id])
		@single_cart_pics = SingleCartPic.all
		sum = 0
		@single_cart_pics.each do |k|
			sum += k.amount * k.cat_picture.price
		end
		@total_amount = sum	
  end

end
