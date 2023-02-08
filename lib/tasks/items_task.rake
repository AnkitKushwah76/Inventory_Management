
require 'csv'
namespace :items_task do 
    desc 'Greeting message task'

    task great_the_item: :environment do 
        puts "hello Item! wellcome to the rake world!----"
        file = "db/csv_data/item.csv"
        CSV.foreach(file, :headers => true) do |row|
            byebug
        Item.create(:itemName => row[1],:price => row[2],:itemImage => row[3],:user_id =>"1" )
         end
    end
end



