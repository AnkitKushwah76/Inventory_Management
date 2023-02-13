require 'date'
class Invoice < ApplicationRecord
  belongs_to :item
  after_validation :create_invoices_date_and_time
  
  private
  def create_invoices_date_and_time
    time= Time.new
      item_id=self.item_id
      item=Item.find(item_id)
      self.item_name=item.item_name
      self.item_price=item.item_price
      self.item_image=item.item_image
      self.date=time.strftime("%d/%m/%Y")   
      self.time=time.strftime("%I:%M %p") 
 puts "after--------------------------111111"
  end
end
