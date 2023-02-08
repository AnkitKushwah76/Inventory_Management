class CreateInvoices < ActiveRecord::Migration[7.0]
  def change
    create_table :invoices do |t|
      t.string :customer_name
      t.string :total_price
      t.references :item, null: false, foreign_key: true

      t.timestamps
    end
  end
end
