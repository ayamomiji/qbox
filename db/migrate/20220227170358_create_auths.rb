# frozen_string_literal: true

class CreateAuths < ActiveRecord::Migration[7.0]
  def change
    create_table :auths, id: :uuid do |t|
      t.string :provider
      t.string :uid

      t.timestamps

      t.index [:provider, :uid], unique: true
    end
  end
end
