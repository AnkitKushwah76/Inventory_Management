# frozen_string_literal: true

require 'rails_helper'
RSpec.describe Item, type: :model do
  subject { Item.new(itemName: 'laptop', price: '10', user_id: '1') }
  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end
  it 'Itemname canot be blank' do
    subject.itemName = nil
    expect(subject).to_not be_valid
  end
  it 'price greater_than_or_equal_to: 1' do
    expect(subject).to be_valid
  end
end
