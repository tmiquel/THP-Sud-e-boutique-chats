class CartsController < ApplicationController
  def index 
  end			

  def show

	@cart = Cart.find(params[:id])
	@cat = CatPicture.find(params[:id])
	#@cart.items.each do |item| 

  end

  def add_item
    # @cart = Cart.find(params[:cart_id])
    # @item = Item.find(params[:item_id])
	# @cart.items << @item
	# redirect_to root_path
  end

end
