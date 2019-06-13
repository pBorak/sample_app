require 'test_helper'

class RelationshipTest < ActiveSupport::TestCase

  def setup
    @relationship = Relationship.new(follower_id: users(:pawel).id,
                                     followed_id: users(:walter).id)
  end

  test "should be valid" do
    @relationship.valid?
  end

  test "should require a follower_id" do
    @relationship.follower_id = nil
    assert_not @relationship.valid?
  end

  test "should require a followed_id" do
    @relationship.followed_id = nil
    assert_not @relationship.valid?
  end

  test "should follow and unfollow a user" do
    pawel = users(:pawel)
    user_5 = users(:user_5)
    assert_not pawel.following?(user_5)
    pawel.follow(user_5)
    assert pawel.following?(user_5)
    assert user_5.followers.include?(pawel)
    pawel.unfollow(user_5)
    assert_not pawel.following?(user_5)
  end

end
