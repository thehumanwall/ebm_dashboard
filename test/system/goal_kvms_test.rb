require "application_system_test_case"

class GoalKvmsTest < ApplicationSystemTestCase
  setup do
    @goal_kvm = goal_kvms(:one)
  end

  test "visiting the index" do
    visit goal_kvms_url
    assert_selector "h1", text: "Goal kvms"
  end

  test "should create goal kvm" do
    visit goal_kvms_url
    click_on "New goal kvm"

    fill_in "Goal", with: @goal_kvm.goal_id
    fill_in "Kvm", with: @goal_kvm.kvm_id
    click_on "Create Goal kvm"

    assert_text "Goal kvm was successfully created"
    click_on "Back"
  end

  test "should update Goal kvm" do
    visit goal_kvm_url(@goal_kvm)
    click_on "Edit this goal kvm", match: :first

    fill_in "Goal", with: @goal_kvm.goal_id
    fill_in "Kvm", with: @goal_kvm.kvm_id
    click_on "Update Goal kvm"

    assert_text "Goal kvm was successfully updated"
    click_on "Back"
  end

  test "should destroy Goal kvm" do
    visit goal_kvm_url(@goal_kvm)
    click_on "Destroy this goal kvm", match: :first

    assert_text "Goal kvm was successfully destroyed"
  end
end
