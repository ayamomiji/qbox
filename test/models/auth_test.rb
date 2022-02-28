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
require "test_helper"

class AuthTest < ActiveSupport::TestCase
  describe '.from_auth_hash' do
    it 'find or create from auth_hash' do
      auth_hash = {
        'provider' => 'developer',
        'uid' => '1'
      }
      auth = Auth.from_auth_hash(auth_hash)
      assert auth
      assert_equal auth, Auth.from_auth_hash(auth_hash)
    end
  end
end
