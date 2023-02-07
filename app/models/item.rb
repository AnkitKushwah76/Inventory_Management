class Item < ApplicationRecord
    has_one :stock 
    belongs_to :user ,optional: true

    before_create do
        puts "ooooookkkkk777"
        puts self.itemName
      end
end
