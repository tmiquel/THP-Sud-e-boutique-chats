FactoryBot.define do
  factory :single_cart_pic do
    cart { Cart.all.sample }
		cat_picture { CatPicture.all.sample }
		amount { Faker::Number.positive.to_i }
  end
end
