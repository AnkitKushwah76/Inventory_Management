require 'csv'
CSV.open('item.csv','wb') do |csv|

    csv <<['itemName','price','user_id']
    csv <<['laptop','1200','1']
    csv <<['latopHp','1300','1']
    csv <<['laptop','1200','1']
    csv <<['laptop','1200','1']
    csv <<['laptop','1200','1']
    csv <<['laptop','1200','1']
    csv <<['laptop','1200','1']
    csv <<['laptop','1200','1']
    csv <<['laptop','1200','1']

end
