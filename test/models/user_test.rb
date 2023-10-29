require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(
      name: "John Doe",
      email: "john@example.com",
      password: "password123",
      phone_number: "+56 9 1234 5678",
      description: "I am John Doe",
      image: "foto.jpg"
    )
  end

  test "should be valid" do
    unless @user.valid?
      puts @user.errors.full_messages.join(", ")
    end
    assert @user.valid?
  end
  

  test "name should be present" do
    @user.name = ""
    assert_not @user.valid?, "saved user without a name"
  end

  test "email should be present" do
    @user.email = ""
    assert_not @user.valid?, "saved user without an email"
  end

  test "phone_number should be present" do
    @user.phone_number = ""
    assert_not @user.valid?, "saved user without a phone_number"
  end
end
