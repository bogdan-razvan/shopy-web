# frozen_string_literal: true

# == Schema Information
#
# Table name: members
#
#  address         :text
#  avatar_id       :bigint
#  birth_date      :date
#  created_at      :datetime         not null
#  email           :string
#  fullname        :string
#  id              :bigint           not null, primary key
#  password_digest :string
#  phone           :string
#  updated_at      :datetime         not null
#  username        :string
#
# Indexes
#
#  index_members_on_avatar_id  (avatar_id)
#
# Foreign Keys
#
#  fk_rails_...  (avatar_id => avatars.id)
#

class MemberReviewSerializer < ActiveModel::Serializer
  attributes :fullname, :avatar_url

  def avatar_url
    Rails.application.routes.url_helpers.rails_blob_url(object.avatar.image) if object.avatar&.image
  end
end
