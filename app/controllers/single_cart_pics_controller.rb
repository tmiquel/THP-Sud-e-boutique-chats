class SingleCartPicsController < ApplicationController

	def create
		@cat_picture = CatPicture.find(params[:cat_picture_id]
		if single_cart_pic = SingleCartPic.create(cat_picture: @cat_picture), cart: current_user.cart, amount: 1)
			redirect_to user_cart_path(current_user)
		else
			redirect_to cat_picture_path(@cat_picture)
		end
	end

  def update
		@single_cart_pic = SingleCartPic.find(params[:id])
		if (params[:ope] == "+")
			@single_cart_pic.increment!(:amount)
		elsif (params[:ope] == "-")
			if (@single_cart_pic.amount > 1)
    		@single_cart_pic.decrement!(:amount)
			end
		end
		puts @single_cart_pic.errors.messages
		tp @single_cart_pic
    redirect_to user_cart_path(@single_cart_pic.cart)
	end

  def destroy
		@single_cart_pic = SingleCartPic.find(params[:id])
		@single_cart_pic.delete
  end

end
