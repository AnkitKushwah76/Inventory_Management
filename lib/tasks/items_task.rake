require 'csv'
namespace :items_task do
  desc 'Greeting message task'
  task create_item: :environment do
    file = 'db/csv_data/item.csv'
    CSV.foreach(file, headers: :true) do |row|
      if row.to_hash.has_value?(nil) != true
        item = Item.create!(itemName: row['itemName'], price: row['price'], user_id: row['user_id'])
        Stock.create!(quntity: row['quantity'], item_id: item.id)
      end
    end
  end
end
