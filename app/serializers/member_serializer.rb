# frozen_string_literal: true

# == Schema Information
#
# Table name: members
#
#  address         :text
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

class MemberSerializer < ActiveModel::Serializer
  attributes :email, :fullname, :username, :address, :phone, :birth_date

  has_one :tokens, if: :with_auth_tokens?

  def with_auth_tokens?
    instance_options[:with_auth_tokens]
  end
end
