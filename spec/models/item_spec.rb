require 'rails_helper'

RSpec.describe Item, type: :model do

    subject{Item.new(itemName:"laptop",price:"12000",user_id:"1")}

    it "is valid with valid attributes" do
      expect(subject).to be_valid
    end

    it "Itemname can't be blank" do
      subject.itemName = nil
      #expect(subject).to be_valid
      expect(subject).to_not be_valid
    end

    it "is not valid without a email" do
      subject.email = nil
      expect(subject).to_not be_valid
    end
   
  # it "is not valid without a mobile_number" do
  #   subject.mobile_number = nil
  #   expect(subject).to_not be_valid
   end
