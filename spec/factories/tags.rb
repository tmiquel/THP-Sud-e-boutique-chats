# frozen_string_literal: true

FactoryBot.define do
  factory :tag do
    tag_name { Faker::Types.unique.rb_string }
  end
end
