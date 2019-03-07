class PurchasesController < ApplicationController
	def new
end
  def create

	@amount = params[:amount]
	@user = current_user
	@cart = @user.carts[0]

  	customer = Stripe::Customer.create({
      email: params[:stripeEmail],
      source: params[:stripeToken],
      })

    charge = Stripe::Charge.create({
      customer: customer.id,
      amount: @amount*100,
      description: 'Rails Stripe customer',
      currency: 'eur',
    })
    	if customer&&charge
    		purchase = Purchase.create(cart: @cart, purchase_date: Time.now.to_date, stripe_customer_id: charge.customer)

	  		Purchase.where(cart: @cart).each do |purchase_to_delete|
  				purchase_to_delete.delete
  			end
  			redirect_to root_path
  		else
  			redirect_to user_cart_path(@user, @cart)
  		end

  	rescue Stripe::CardError => e
    	flash[:error] = e.message
    	redirect_to root_path(@user)
  	end

end
