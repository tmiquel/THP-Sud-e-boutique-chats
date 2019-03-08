# frozen_string_literal: true

class User < ApplicationRecord
  after_create -> { create_user_cart(self) }

  extend FriendlyId
  friendly_id :full_name, use: :slugged
  after_create :send_registration_confirm
  after_create -> { create_user_cart(self) }
  has_one_attached :avatar
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :first_name, presence: true
  validates :last_name, presence: true
  has_one :cart, foreign_key: 'owner_id'
  has_many :single_cart_pics, through: :carts
  has_many :purchases, through: :single_cart_pics

  def full_name
    "#{first_name} #{last_name}"
  end

  private

  def send_registration_confirm
    UserMailer.registration_confirm(self).deliver_now
  end
	def full_name
		self.first_name + self.last_name
	end

  def create_user_cart(user)
    Cart.create(owner: user)
  end
end
