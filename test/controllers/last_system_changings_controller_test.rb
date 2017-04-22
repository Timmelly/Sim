require 'test_helper'

class LastSystemChangingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @last_system_changing = last_system_changings(:one)
  end

  test "should get index" do
    get last_system_changings_url
    assert_response :success
  end

  test "should get new" do
    get new_last_system_changing_url
    assert_response :success
  end

  test "should create last_system_changing" do
    assert_difference('LastSystemChanging.count') do
      post last_system_changings_url, params: { last_system_changing: { changing_date: @last_system_changing.changing_date } }
    end

    assert_redirected_to last_system_changing_url(LastSystemChanging.last)
  end

  test "should show last_system_changing" do
    get last_system_changing_url(@last_system_changing)
    assert_response :success
  end

  test "should get edit" do
    get edit_last_system_changing_url(@last_system_changing)
    assert_response :success
  end

  test "should update last_system_changing" do
    patch last_system_changing_url(@last_system_changing), params: { last_system_changing: { changing_date: @last_system_changing.changing_date } }
    assert_redirected_to last_system_changing_url(@last_system_changing)
  end

  test "should destroy last_system_changing" do
    assert_difference('LastSystemChanging.count', -1) do
      delete last_system_changing_url(@last_system_changing)
    end

    assert_redirected_to last_system_changings_url
  end
end
