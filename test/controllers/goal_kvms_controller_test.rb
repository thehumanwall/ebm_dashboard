require "test_helper"

class GoalKvmsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @goal_kvm = goal_kvms(:one)
  end

  test "should get index" do
    get goal_kvms_url
    assert_response :success
  end

  test "should get new" do
    get new_goal_kvm_url
    assert_response :success
  end

  test "should create goal_kvm" do
    assert_difference("GoalKvm.count") do
      post goal_kvms_url, params: { goal_kvm: { goal_id: @goal_kvm.goal_id, kvm_id: @goal_kvm.kvm_id } }
    end

    assert_redirected_to goal_kvm_url(GoalKvm.last)
  end

  test "should show goal_kvm" do
    get goal_kvm_url(@goal_kvm)
    assert_response :success
  end

  test "should get edit" do
    get edit_goal_kvm_url(@goal_kvm)
    assert_response :success
  end

  test "should update goal_kvm" do
    patch goal_kvm_url(@goal_kvm), params: { goal_kvm: { goal_id: @goal_kvm.goal_id, kvm_id: @goal_kvm.kvm_id } }
    assert_redirected_to goal_kvm_url(@goal_kvm)
  end

  test "should destroy goal_kvm" do
    assert_difference("GoalKvm.count", -1) do
      delete goal_kvm_url(@goal_kvm)
    end

    assert_redirected_to goal_kvms_url
  end
end
