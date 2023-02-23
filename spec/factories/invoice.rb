# frozen_string_literal: true

FactoryBot.define do
  factory :invoice do
    item_name { 'redmi note 9 pro' }
    item_price { '1200' }
    item_quatity { '12' }
    date { '20/02/2023' }
    time { '05:10 PM' }
    total_amount { '1200' }
    item
  end
end
