class User < ApplicationRecord
	after_create :send_registration_confirm
	has_one_attached :avatar
  # Include default devise modules. Others available are:
	# :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

	
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
	validates :first_name, presence: true
	validates :last_name, presence: true
	has_many :cart, foreign_key: 'owner_id'
	has_many :single_cart_pics, through: :carts
	has_many :purchases, through: :single_cart_pics
	

private
	def send_registration_confirm
    UserMailer.registration_confirm(self).deliver_now
  end

end
