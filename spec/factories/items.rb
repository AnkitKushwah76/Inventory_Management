# frozen_string_literal: true

FactoryBot.define do
  factory :items do
    itemName { 'laptop' }
    price { '10' }
    user_id { '1' }
  end
end
