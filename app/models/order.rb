# frozen_string_literal: true

# == Schema Information
#
# Table name: orders
#
#  created_at  :datetime         not null
#  id          :bigint           not null, primary key
#  member_id   :bigint           not null
#  total_price :float
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_orders_on_member_id  (member_id)
#
# Foreign Keys
#
#  fk_rails_...  (member_id => members.id)
#

class Order < ApplicationRecord
  belongs_to :member
end
