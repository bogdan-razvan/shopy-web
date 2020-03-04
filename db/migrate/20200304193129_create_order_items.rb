# frozen_string_literal: true

class CreateOrderItems < ActiveRecord::Migration[6.0]
  def change
    create_table :order_items do |t|
      t.references :order, foreign_key: true
      t.references :member, null: false, foreign_key: true
      t.references :product, null: false, foreign_key: true
      t.integer :quantity
      t.integer :status, default: 0, null: false

      t.timestamps
    end
  end
end
