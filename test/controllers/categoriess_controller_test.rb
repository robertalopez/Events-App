require 'test_helper'

class CategoriessControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get categoriess_index_url
    assert_response :success
  end

  test "should get show" do
    get categoriess_show_url
    assert_response :success
  end

  test "should get new" do
    get categoriess_new_url
    assert_response :success
  end

  test "should get create" do
    get categoriess_create_url
    assert_response :success
  end

end
