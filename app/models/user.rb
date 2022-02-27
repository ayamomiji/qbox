# == Schema Information
#
# Table name: users
#
#  id         :uuid             not null, primary key
#  nickname   :string
#  provider   :string
#  slug       :string
#  uid        :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_users_on_provider_and_uid  (provider,uid) UNIQUE
#  index_users_on_slug              (slug) UNIQUE
#
class User < ApplicationRecord
  extend FriendlyId

  friendly_id :nickname, use: :slugged

  belongs_to :auth, optional: true

  validates :nickname, presence: true

  def normalize_friendly_id(input)
    input.to_s.to_slug.normalize.to_s
  end
end
