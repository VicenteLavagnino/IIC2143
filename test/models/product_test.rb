require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  def setup
    @user = User.create(
      name: "John Doe",
      email: "john@example.com",
      password: "password123",
      phone_number: "+56 9 1234 5678"
    )
    @product = Product.new(
      name: "Example Product",
      description: "This is an example product.",
      image: "example.jpg",
      set: "Example Set",
      user: @user
    )
  end

  test "should be valid with all attributes" do
    assert @product.valid?
  end

  test "name should be present" do
    @product.name = ""
    assert_not @product.valid?, "saved product without a name"
  end

  test "description should be present" do
    @product.description = ""
    assert_not @product.valid?, "saved product without a description"
  end

  test "image should be present" do
    @product.image = ""
    assert_not @product.valid?, "saved product without an image"
  end

  test "set should be present" do
    @product.set = ""
    assert_not @product.valid?, "saved product without a set"
  end

  test "user should be present" do
    @product.user = nil
    assert_not @product.valid?, "saved product without a user"
  end

  teardown do
    @user.destroy
  end
end

