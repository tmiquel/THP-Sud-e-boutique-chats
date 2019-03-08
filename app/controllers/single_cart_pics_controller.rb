# frozen_string_literal: true

class SingleCartPicsController < ApplicationController
  def create; end

  def update
    @single_cart_pic = SingleCartPic.find(params[:id])
    if params[:ope] == '+'
      @single_cart_pic.increment!(:amount)
    elsif params[:ope] == '-'
      @single_cart_pic.decrement!(:amount) if @single_cart_pic.amount > 1
    end
    redirect_to user_cart_path(current_user)
   end

  def destroy
    @single_cart_pic = SingleCartPic.find(params[:id])
    @single_cart_pic.delete
    redirect_to user_cart_path(current_user)
  end
end
