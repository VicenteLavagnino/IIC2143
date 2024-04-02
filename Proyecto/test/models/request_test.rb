require 'test_helper'

class RequestTest < ActiveSupport::TestCase
  def setup
    @user11 = User.create!(
      name: "John Doe",
      email: "john@example.com",
      password: "password123",
      phone_number: "+56 9 1234 5678"
    )
    @product11 = Product.create!(
      name: "Example Product",
      description: "This is an example product.",
      image: "example.jpg",
      set: "Example Set",
      user: @user11
    )
    @request = Request.new(
      product: @product11,
      description: "This is an example request.",
      state: "Pending"
    )
  end

  test "should be valid with all attributes" do
    assert @request.valid?
  end

  test "product should be present" do
    @request.product = nil
    assert_not @request.valid?, "saved request without a product"
  end

  test "description should be present" do
    @request.description = ""
    assert_not @request.valid?, "saved request without a description"
  end


  test "state should be present" do
    @request.state = ""
    assert_not @request.valid?, "saved request without a state"
  end
  teardown do
    @product11.destroy if @product11.present?
    @user11.destroy if @user11.present?
  end
  
end
