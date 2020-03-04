# frozen_string_literal: true

# == Schema Information
#
# Table name: reviews
#
#  comment    :string
#  created_at :datetime         not null
#  id         :bigint           not null, primary key
#  member_id  :bigint           not null
#  product_id :bigint           not null
#  updated_at :datetime         not null
#  value      :integer
#
# Indexes
#
#  index_reviews_on_member_id   (member_id)
#  index_reviews_on_product_id  (product_id)
#
# Foreign Keys
#
#  fk_rails_...  (member_id => members.id)
#  fk_rails_...  (product_id => products.id)
#

class ReviewSerializer < ActiveModel::Serializer
  attributes :value, :comment
end
