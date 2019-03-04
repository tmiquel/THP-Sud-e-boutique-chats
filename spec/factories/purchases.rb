FactoryBot.define do
  factory :purchase do
    single_cart_pic { SingleCartPic.all.sample }
    quantities { Faker::Number.number(2) }
    purchase_date { Date.new }
		stripe_customer_id { Faker::Science.scientist }    
  end
end
