class Purchase < ApplicationRecord
	after_create :send_purchase_confirm

	belongs_to :cart
	validates :purchase_date, presence: true
	validates :stripe_customer_id, presence: true

private
	def send_purchase_confirm
		UserMailer.purchase_confirm(self.cart.owner).deliver_now
	end

end
