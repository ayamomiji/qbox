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
require "test_helper"

class UserTest < ActiveSupport::TestCase
  it "generates random nickname if it is empty" do
    assert User.create.nickname
  end

  it "should have friendly id" do
    user = User.create!(nickname: "ayaya")
    assert user.slug
  end
end
