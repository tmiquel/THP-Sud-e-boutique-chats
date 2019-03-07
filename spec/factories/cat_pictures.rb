FactoryBot.define do
  factory :cat_picture do
    title { Faker::Creature::Cat.breed }
    price { rand(2..27) }
  end
end

