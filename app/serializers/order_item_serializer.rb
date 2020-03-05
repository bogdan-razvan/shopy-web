# frozen_string_literal: true

# == Schema Information
#
# Table name: order_items
#
#  created_at :datetime         not null
#  id         :bigint           not null, primary key
#  member_id  :bigint           not null
#  order_id   :bigint
#  product_id :bigint           not null
#  quantity   :integer
#  status     :integer          default("pending"), not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_order_items_on_member_id   (member_id)
#  index_order_items_on_order_id    (order_id)
#  index_order_items_on_product_id  (product_id)
#
# Foreign Keys
#
#  fk_rails_...  (member_id => members.id)
#  fk_rails_...  (order_id => orders.id)
#  fk_rails_...  (product_id => products.id)
#

class OrderItemSerializer < ActiveModel::Serializer
  attributes :id, :quantity

  has_one :product
end
