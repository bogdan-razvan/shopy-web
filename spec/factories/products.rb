# frozen_string_literal: true

# == Schema Information
#
# Table name: products
#
#  created_at   :datetime         not null
#  description  :text
#  id           :bigint           not null, primary key
#  name         :string
#  price        :float
#  product_type :string
#  stock        :integer
#  updated_at   :datetime         not null
#

FactoryBot.define do
  factory :product do
    name { 'MyString' }
    product_type { 'MyString' }
    description { 'MyText' }
    stock { 1 }
    price { 1.5 }
  end
end
