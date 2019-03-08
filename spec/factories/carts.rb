# frozen_string_literal: true

FactoryBot.define do
  factory :cart do
    owner { User.all.sample }
  end
end
