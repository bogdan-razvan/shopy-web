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

class MemberSerializer < ActiveModel::Serializer
  attributes :email, :fullname, :username, :address, :phone, :birth_date, :avatar_url

  has_one :tokens, if: :with_auth_tokens?

  def with_auth_tokens?
    instance_options[:with_auth_tokens]
  end

  def avatar_url
    if object.avatar&.image
      Rails.application.routes.url_helpers.rails_blob_path(
        object.avatar.image,
        disposition: 'attachment'
      )
    end
  end
end
