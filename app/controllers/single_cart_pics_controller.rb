class SingleCartPicsController < ApplicationController
  def increase_amount
		@single_cart_pic = SingleCartPic.find(params[:scp_id])
		@single_cart_pic.amount += 1
		redirect_to "single_cart_pics#show"
  end
	
	def decrease_amount
		@single_cart_pic = SingleCartPic.find(params[:scp_id])
		if @single_cart_pic.amount > 1
    	@single_cart_pic.amount -= 1 
		end
    redirect_to "single_cart_pics#show"
	end

  def destroy
		@single_cart_pic = SingleCartPic.find(params[:id])
		@single_cart_pic.delete
  end
end
