# frozen_string_literal: true

class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.references :member, null: false, foreign_key: true
      t.references :product, null: false, foreign_key: true
      t.integer :value
      t.string :comment

      t.timestamps
    end
  end
end
