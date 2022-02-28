# frozen_string_literal: true

class AddArchivedToQuestions < ActiveRecord::Migration[7.0]
  def change
    add_column :questions, :archived, :boolean, null: false, default: false
  end
end
