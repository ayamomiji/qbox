# frozen_string_literal: true

# == Schema Information
#
# Table name: questions
#
#  id         :uuid             not null, primary key
#  answered   :boolean          default(FALSE), not null
#  body       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :uuid             not null
#
# Indexes
#
#  index_questions_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
require "test_helper"

class QuestionTest < ActiveSupport::TestCase
  describe "#mark_as_answered!" do
    it "updates answered" do
      question = Question.create(user: User.create, skip_response: true)
      question.mark_as_answered!
      assert question.answered?
    end
  end
end
