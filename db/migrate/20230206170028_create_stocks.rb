class CreateStocks < ActiveRecord::Migration[7.0]
  def change
    create_table :stocks do |t|
      t.string :quntity
      t.references :item, null: false, foreign_key: true


      t.timestamps
    end
  end
end
