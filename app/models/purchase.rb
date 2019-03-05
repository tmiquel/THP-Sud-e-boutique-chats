class Purchase < ApplicationRecord
	after_create :send_purchase_confirm

	belongs_to :single_cart_pic
	validates :quantities, presence: true
	validates :purchase_date, presence: true
	validates :stripe_customer_id, presence: true
	validate :valid_quantities

private
	def valid_quantities
		errors.add(:quantities, message: "Quantity must be a strictly positive integer") unless ((self.quantities.is_a? Integer) && (self.quantities > 0))
	end

	def send_purchase_confirm
		UserMailer.purchase_confirm(self.single_cart_pic.cart.owner).deliver_now
	end

end
