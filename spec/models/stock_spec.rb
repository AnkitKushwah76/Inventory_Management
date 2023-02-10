require 'rails_helper'

RSpec.describe Item, type: :model do
 
    subject=Stock.new(quntity:"1111")
   
  

    it "is valid with valid attributes" do
      expect(subject).to be_valid
    end

    it "quntity can't be blank" do
      subject.quntity = nil
      #expect(subject).to be_valid
      expect(subject).to_not be_valid
    end

 
    it" quntity  greater_than_or_equal_to: 1" do
        subject.quntity = 0     
        #expect(subject).to be_valid
        expect(subject).to_not be_valid
      end
   
   
  
   end
