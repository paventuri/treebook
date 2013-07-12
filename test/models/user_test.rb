require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "an user should enter a first name" do
    user = User.new
    assert !user.save
    assert !user.errors[:first_name].empty?
  end

  test "an user should enter a last name" do
    user = User.new
    assert !user.save
    assert !user.errors[:last_name].empty?
  end

  test "an user should enter a profile name" do
    user = User.new
    assert !user.save
    assert !user.errors[:profile_name].empty?
  end

  test "an user should have an unique profile name" do
  	user = User.new
  	user.profile_name = users(:paulo).profile_name

  	assert !user.save
  	assert !user.errors[:profile_name].empty?
  end

  test "an user should have a profile name without spaces" do
    user = User.new
    user.profile_name = "paulo venturi"

    assert !user.save
    assert !user.errors[:profile_name].empty?
    assert user.errors[:profile_name].include?("Must be formatted correctly.")
  end
end
