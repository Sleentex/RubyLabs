require "test_helper"

class AdverisementsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get adverisements_index_url
    assert_response :success
  end

  test "should get show" do
    get adverisements_show_url
    assert_response :success
  end

  test "should get new" do
    get adverisements_new_url
    assert_response :success
  end

  test "should get edit" do
    get adverisements_edit_url
    assert_response :success
  end
end
