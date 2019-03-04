class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
	validates :first_name, presence: true
	validates :last_name, presence: true
	has_many :carts, foreign_key: 'owner_id'
	has_many :single_cart_pics, through: :carts
	has_many :purchases, through: :single_cart_pics
end
