FactoryBot.define do
  factory :purchase do
    cart { Cart.all.sample }
    purchase_date { Date.new }
		stripe_customer_id { Faker::Science.scientist }    
  end
end
