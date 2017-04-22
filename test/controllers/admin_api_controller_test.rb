require 'test_helper'

class AdminApiControllerTest < ActionDispatch::IntegrationTest
  test "should get computer_states" do
    get admin_api_computer_states_url
    assert_response :success
  end

  test "should get screenshot" do
    get admin_api_screenshot_url
    assert_response :success
  end

  test "should get reboot" do
    get admin_api_reboot_url
    assert_response :success
  end

  test "should get user_info" do
    get admin_api_user_info_url
    assert_response :success
  end

  test "should get change_password" do
    get admin_api_change_password_url
    assert_response :success
  end

  test "should get logout" do
    get admin_api_logout_url
    assert_response :success
  end

  test "should get user_block" do
    get admin_api_user_block_url
    assert_response :success
  end

  test "should get user_proccesses" do
    get admin_api_user_proccesses_url
    assert_response :success
  end

end
