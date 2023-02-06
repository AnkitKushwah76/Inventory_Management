require "test_helper"

class SelleruserControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get selleruser_index_url
    assert_response :success
  end

  test "should get show" do
    get selleruser_show_url
    assert_response :success
  end

  test "should get new" do
    get selleruser_new_url
    assert_response :success
  end

  test "should get create" do
    get selleruser_create_url
    assert_response :success
  end

  test "should get edit" do
    get selleruser_edit_url
    assert_response :success
  end

  test "should get update" do
    get selleruser_update_url
    assert_response :success
  end
end
