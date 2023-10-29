require 'test_helper'

class ChatTest < ActiveSupport::TestCase
  def setup
    @user1 = User.create(
      name: "John Doe",
      email: "john@example.com",
      password: "password123",
      phone_number: "+56 9 1234 5678",
      description: "I am John Doe",
      image: "foto.jpg"
    )

    @user2 = User.create(
      name: "Jane Doe",
      email: "jane@example.com",
      password: "password123",
      phone_number: "+56 9 8765 4321",
      description: "I am Jane Doe",
      image: "foto2.jpg"
    )

    @chat = Chat.new(
      user1: @user1,
      user2: @user2,
    )
  end

  test "should be valid" do
    assert @chat.valid?
  end

  test "should have user1" do
    @chat.user1 = nil
    assert_not @chat.valid?, "saved chat without a user1"
  end

  test "should have user2" do
    @chat.user2 = nil
    assert_not @chat.valid?, "saved chat without a user2"
  end

 
end
