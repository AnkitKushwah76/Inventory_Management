# frozen_string_literal: true

FactoryBot.define do
  factory :item do
    item_name { 'laptop' }
    item_price { '10' }
    item_quatity{'23'}
    user
  end
end
