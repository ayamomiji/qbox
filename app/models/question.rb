# == Schema Information
#
# Table name: questions
#
#  id         :uuid             not null, primary key
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
class Question < ApplicationRecord
  belongs_to :user

  scope :sorted, -> { order(created_at: :desc) }
end
