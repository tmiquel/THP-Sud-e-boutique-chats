# frozen_string_literal: true

FactoryBot.define do
  factory :purchase do
    cart { Cart.all.sample }
    purchase_date { Date.new }
    stripe_customer_id { Faker::Science.unique.scientist }
  end
end
