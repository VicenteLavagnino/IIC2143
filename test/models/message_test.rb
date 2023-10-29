require 'test_helper'

class MessageTest < ActiveSupport::TestCase
  def setup
    @user = User.create(
      name: "John Doe",
      email: "john@example.com",
      password: "password123",
      phone_number: "+56 9 1234 5678"
    )
    @user2 = User.create(
        name: "John Doee",
        email: "john@examplee.com",
        password: "password123",
        phone_number: "+56 9 1234 5678"
      )

    @chat = Chat.create(
        user1: @user,
        user2: @user2
    )

    @message = Message.new(
      user: @user,
      chat: @chat,
      content: "This is a test message.",
    )
  end

  test "should be valid with all attributes" do
    assert @message.valid?
  end

  test "user should be present" do
    @message.user = nil
    assert_not @message.valid?, "saved message without a user"
  end

  test "chat should be present" do
    @message.chat = nil
    assert_not @message.valid?, "saved message without a chat"
  end

  test "content should be present" do
    @message.content = ""
    assert_not @message.valid?, "saved message without content"
  end


 
  teardown do
    
    @message.destroy if @message.persisted?  
    @chat.destroy
    @user.destroy
  end
end
