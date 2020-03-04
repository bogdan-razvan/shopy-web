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

class ProductSerializer < ActiveModel::Serializer
  attributes :id, :name, :product_type, :description, :stock, :price, :image_url

  def image_url
    Rails.application.routes.url_helpers.rails_blob_path(object.image, disposition: 'attachment')
  end
end
