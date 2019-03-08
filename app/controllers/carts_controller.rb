# frozen_string_literal: true

class CartsController < ApplicationController
  before_action -> { authenticate_user!(force: true) }

  before_action :set_user_cart, only: %i[show]
  before_action :authenticate_user!
  before_action :access_my_cart_only, only: %i[show]

  def show
    @user = current_user
    @cart = current_user.cart
    @single_cart_pics = SingleCartPic.where(cart: @cart)
    @user_id = User.friendly.find(params[:user_id])
    sum = 0
    @single_cart_pics.each do |k|
      sum += k.amount * k.cat_picture.price
    end
    @total_amount = sum
  end
end
