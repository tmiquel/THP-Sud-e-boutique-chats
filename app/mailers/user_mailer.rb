class UserMailer < ApplicationMailer
	default from: 'noreply@cat-e-store.com'

	def purchase_confirm(user)
		@user = user
		mail(to: @user.email, subject: "Confirmation d'achat")
	end

end
