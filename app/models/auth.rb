class Auth < ApplicationRecord
  has_one :user

  def self.from_auth_hash(auth_hash)
    provider, uid = auth_hash.values_at("provider", "uid")
    find_or_create_by(provider: provider, uid: uid)
  end
end
