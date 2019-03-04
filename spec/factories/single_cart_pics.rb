FactoryBot.define do
  factory :single_cart_pic do
    cart { Cart.all.sample }
		cat_picture { CatPicture.all.sample }
  end
end
