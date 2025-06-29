require "application_system_test_case"

class ExperimentsTest < ApplicationSystemTestCase
  setup do
    @experiment = experiments(:one)
  end

  test "visiting the index" do
    visit experiments_url
    assert_selector "h1", text: "Experiments"
  end

  test "should create experiment" do
    visit experiments_url
    click_on "New experiment"

    fill_in "Actions taken", with: @experiment.actions_taken
    fill_in "Adaptation summary", with: @experiment.adaptation_summary
    fill_in "End date", with: @experiment.end_date
    fill_in "Goal", with: @experiment.goal_id
    fill_in "Hypothesis", with: @experiment.hypothesis
    fill_in "Inspection summary", with: @experiment.inspection_summary
    fill_in "Name", with: @experiment.name
    fill_in "Start date", with: @experiment.start_date
    fill_in "Status", with: @experiment.status
    click_on "Create Experiment"

    assert_text "Experiment was successfully created"
    click_on "Back"
  end

  test "should update Experiment" do
    visit experiment_url(@experiment)
    click_on "Edit this experiment", match: :first

    fill_in "Actions taken", with: @experiment.actions_taken
    fill_in "Adaptation summary", with: @experiment.adaptation_summary
    fill_in "End date", with: @experiment.end_date.to_s
    fill_in "Goal", with: @experiment.goal_id
    fill_in "Hypothesis", with: @experiment.hypothesis
    fill_in "Inspection summary", with: @experiment.inspection_summary
    fill_in "Name", with: @experiment.name
    fill_in "Start date", with: @experiment.start_date.to_s
    fill_in "Status", with: @experiment.status
    click_on "Update Experiment"

    assert_text "Experiment was successfully updated"
    click_on "Back"
  end

  test "should destroy Experiment" do
    visit experiment_url(@experiment)
    click_on "Destroy this experiment", match: :first

    assert_text "Experiment was successfully destroyed"
  end
end
