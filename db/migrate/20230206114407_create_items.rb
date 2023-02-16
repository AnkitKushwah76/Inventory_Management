# frozen_string_literal: true

class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.string :item_name
      t.string :item_price
      t.string :item_quatity
      t.string :item_image
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
