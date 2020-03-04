# frozen_string_literal: true

class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :name
      t.string :product_type
      t.text :description
      t.integer :stock
      t.float :price

      t.timestamps
    end
  end
end
