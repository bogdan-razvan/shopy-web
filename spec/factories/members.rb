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

FactoryBot.define do
  factory :member do
    username { 'MyString' }
    password { 'MyString' }
    email { 'MyString' }
    fullname { 'MyString' }
    address { 'MyText' }
    phone { 'MyString' }
    birth_date { '2020-03-04' }
  end
end
