FactoryBot.define do
  factory :tag do
    tag_name { Faker::Types.rb_string }    
  end
end
