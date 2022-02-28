# frozen_string_literal: true

class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users, id: :uuid do |t|
      t.belongs_to :auth
      t.string :nickname
      t.string :slug

      t.timestamps

      t.index :slug, unique: true
    end
  end
end
