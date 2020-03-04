# frozen_string_literal: true

class CreateMembers < ActiveRecord::Migration[6.0]
  def change
    create_table :members do |t|
      t.string :username
      t.string :password_digest
      t.string :email
      t.string :fullname
      t.text :address
      t.string :phone
      t.date :birth_date

      t.timestamps
    end
  end
end
