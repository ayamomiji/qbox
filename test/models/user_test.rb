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
