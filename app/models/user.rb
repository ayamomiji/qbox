# == Schema Information
#
# Table name: users
#
#  id         :uuid             not null, primary key
#  nickname   :string
#  slug       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  auth_id    :bigint
#
# Indexes
#
#  index_users_on_auth_id  (auth_id)
#  index_users_on_slug     (slug) UNIQUE
#
class User < ApplicationRecord
  extend FriendlyId

  friendly_id :nickname, use: :slugged

  belongs_to :auth, optional: true
  has_many :questions
  has_many :answers, through: :questions

  validates :nickname, presence: true

  before_validation :set_random_nickname

  def normalize_friendly_id(input)
    input.to_s.to_slug.normalize.to_s
  end

  def set_random_nickname
    self.nickname = self.nickname.presence || SecureRandom.uuid
  end
end
