class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.string :itemName
      t.string :price
      t.string :itemQuantity
      t.integer :user_id

      t.timestamps
    end
  end
end
