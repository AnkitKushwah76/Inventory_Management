require 'csv'
CSV.open('item.csv', 'wb') do |csv|
  csv << %w[itemName price user_id]
  csv << %w[laptop 1200 1]
  csv << %w[latopHp 1300 1]
  csv << %w[laptop 1200 1]
  csv << %w[laptop 1200 1]
  csv << %w[laptop 1200 1]
  csv << %w[laptop 1200 1]
  csv << %w[laptop 1200 1]
  csv << %w[laptop 1200 1]
  csv << %w[laptop 1200 1]
end
