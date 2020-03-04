# frozen_string_literal: true

# == Schema Information
#
# Table name: avatars
#
#  created_at :datetime         not null
#  id         :bigint           not null, primary key
#  updated_at :datetime         not null
#

class AvatarSerializer < ActiveModel::Serializer
  attributes :id
end
