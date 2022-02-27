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
require "test_helper"

class UserTest < ActiveSupport::TestCase
  it "should have nickname" do
    refute User.create.valid?
  end

  it "should have friendly id" do
    user = User.create!(nickname: "ayaya")
    assert user.slug
  end
end
