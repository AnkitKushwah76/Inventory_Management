# frozen_string_literal: true

class CreateInvoices < ActiveRecord::Migration[7.0]
  def change
    create_table :invoices do |t|
      t.string :item_name
      t.string :item_price
      t.string :item_quatity
      t.string :item_image
      t.string :date
      t.string :time
      t.string :total_amount
      t.integer :item_id
      t.integer :user_id
      t.timestamps
    end
  end
end
