# frozen_string_literal: true

class AddAvatarToMember < ActiveRecord::Migration[6.0]
  def change
    add_reference :members, :avatar, foreign_key: true
  end
end
