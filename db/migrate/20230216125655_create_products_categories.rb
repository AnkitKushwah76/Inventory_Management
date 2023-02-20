# frozen_string_literal: true

class CreateProductsCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :products_categories do |t|
      t.string :category
      t.string :category_image
      t.timestamps
    end
  end
end
