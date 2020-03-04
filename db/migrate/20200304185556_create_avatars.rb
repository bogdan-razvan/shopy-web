# frozen_string_literal: true

class CreateAvatars < ActiveRecord::Migration[6.0]
  def change
    create_table :avatars, &:timestamps
  end
end
