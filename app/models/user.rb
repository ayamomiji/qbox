class User < ApplicationRecord
  extend FriendlyId

  friendly_id :nickname, use: :slugged

  belongs_to :auth, optional: true

  validates :nickname, presence: true

  def normalize_friendly_id(input)
    input.to_s.to_slug.normalize.to_s
  end
end
