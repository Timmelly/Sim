require 'test_helper'

class ComputerStatusesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @computer_status = computer_statuses(:one)
  end

  test "should get index" do
    get computer_statuses_url
    assert_response :success
  end

  test "should get new" do
    get new_computer_status_url
    assert_response :success
  end

  test "should create computer_status" do
    assert_difference('ComputerStatus.count') do
      post computer_statuses_url, params: { computer_status: { computer_id: @computer_status.computer_id, status: @computer_status.status, users: @computer_status.users } }
    end

    assert_redirected_to computer_status_url(ComputerStatus.last)
  end

  test "should show computer_status" do
    get computer_status_url(@computer_status)
    assert_response :success
  end

  test "should get edit" do
    get edit_computer_status_url(@computer_status)
    assert_response :success
  end

  test "should update computer_status" do
    patch computer_status_url(@computer_status), params: { computer_status: { computer_id: @computer_status.computer_id, status: @computer_status.status, users: @computer_status.users } }
    assert_redirected_to computer_status_url(@computer_status)
  end

  test "should destroy computer_status" do
    assert_difference('ComputerStatus.count', -1) do
      delete computer_status_url(@computer_status)
    end

    assert_redirected_to computer_statuses_url
  end
end
