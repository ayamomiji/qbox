# == Schema Information
#
# Table name: auths
#
#  id         :uuid             not null, primary key
#  provider   :string
#  uid        :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_auths_on_provider_and_uid  (provider,uid) UNIQUE
#
class Auth < ApplicationRecord
  has_one :user

  def self.from_auth_hash(auth_hash)
    provider, uid = auth_hash.values_at("provider", "uid")
    find_or_create_by(provider: provider, uid: uid)
  end
end
