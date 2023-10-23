require "test_helper"

class ChampionshipsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get championships_index_url
    assert_response :success
  end

  test "should get new" do
    get championships_new_url
    assert_response :success
  end

  test "should get create" do
    get championships_create_url
    assert_response :success
  end

  test "should get edit" do
    get championships_edit_url
    assert_response :success
  end

  test "should get destroy" do
    get championships_destroy_url
    assert_response :success
  end
end
