# frozen_string_literal: true

# == Schema Information
#
# Table name: products
#
#  average_rating :float
#  created_at     :datetime         not null
#  description    :text
#  id             :bigint           not null, primary key
#  name           :string
#  price          :float
#  product_type   :string
#  stock          :integer
#  updated_at     :datetime         not null
#

class Product < ApplicationRecord
  has_one_attached :image

  has_many :reviews, dependent: :destroy

  def refresh_average_rating!
    ratings = reviews.pluck(:value)

    update!(average_rating: ratings.sum.to_f / ratings.count)
  end
end
