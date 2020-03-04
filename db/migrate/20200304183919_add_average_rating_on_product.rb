# frozen_string_literal: true

class AddAverageRatingOnProduct < ActiveRecord::Migration[6.0]
  def change
    add_column :products, :average_rating, :float
  end
end
