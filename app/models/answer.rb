# frozen_string_literal: true

# == Schema Information
#
# Table name: answers
#
#  id          :uuid             not null, primary key
#  body        :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  question_id :uuid             not null
#
# Indexes
#
#  index_answers_on_question_id  (question_id)
#
# Foreign Keys
#
#  fk_rails_...  (question_id => questions.id)
#
class Answer < ApplicationRecord
  belongs_to :question

  after_create :mark_question_as_answered!

  scope :recently, -> { order(created_at: :desc).includes(:question) }

  def mark_question_as_answered!
    question.mark_as_answered!
  end
end
