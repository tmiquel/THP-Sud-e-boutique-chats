class Purchase < ApplicationRecord
	belongs_to :single_cart_pic
	validates :quantities, presence: true
	validates :purchase_date, presence: true
	validates :stripe_customer_id, presence: true
	validate :valid_quantities

private
	def valid_quantities
		errors.add(:quantities, message: "Quantity must be a strictly positive integer") unless ((self.quantities.is_a? Integer) && (self.quantities > 0))
	end
end
