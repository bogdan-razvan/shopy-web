# frozen_string_literal: true

class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.references :member, null: false, foreign_key: true
      t.float :total_price

      t.timestamps
    end
  end
end
