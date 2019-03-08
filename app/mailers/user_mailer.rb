# frozen_string_literal: true

class UserMailer < ApplicationMailer
  default from: 'noreply@cat-e-store.com'

  def registration_confirm(user)
    @user = user
    mail(to: @user.email, subject: 'Welcome to our community')
  end

  def purchase_confirm(user)
    @user = user
    mail(to: @user.email, subject: "Confirmation d'achat")
  end
end
