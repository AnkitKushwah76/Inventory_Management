

require 'csv'
  namespace :items_task do
      desc 'Greeting message task'
        task create_item: :environment do 
          file = "db/csv_data/item.csv"
            CSV.foreach(file, headers: :true) do |row|
              byebug
                # item=Item.create!(row.to_hash)
                if row["itemName"] && row["price"] && row["quantity"] && row["user_id"] !=nil
                item=Item.create!(itemName:row["itemName"],price:row["price"],user_id:row["user_id"])
                Stock.create!(quntity:row["quantity"],item_id:item.id)
                else
                  puts"sorry"
                end

            end
        end
end