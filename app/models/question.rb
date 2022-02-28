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
  attr_accessor :response

  belongs_to :user
  has_one :answer

  scope :sorted, -> { order(created_at: :desc) }

  validate :verify_hcaptcha, on: :create

  def verify_hcaptcha
    hcaptcha_response = HTTParty.post("https://hcaptcha.com/siteverify",
                                      body: {
                                        response: response,
                                        secret: ENV["HCAPTCHA_SECRET"],
                                      })
    body = JSON.parse(hcaptcha_response.body)
    return if body["success"]

    errors.add(:response, :invalid)
  end
end
