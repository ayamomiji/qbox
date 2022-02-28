# frozen_string_literal: true

class AddAnsweredToQuestions < ActiveRecord::Migration[7.0]
  def change
    add_column :questions, :answered, :boolean, null: false, default: false

    Question.includes(:answer).find_each do |question|
      question.update(answered: true) if question.answer
    end
  end
end
