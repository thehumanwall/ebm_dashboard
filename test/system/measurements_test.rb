require "application_system_test_case"

class MeasurementsTest < ApplicationSystemTestCase
  setup do
    @measurement = measurements(:one)
  end

  test "visiting the index" do
    visit measurements_url
    assert_selector "h1", text: "Measurements"
  end

  test "should create measurement" do
    visit measurements_url
    click_on "New measurement"

    fill_in "Experiment", with: @measurement.experiment_id
    fill_in "Kvm", with: @measurement.kvm_id
    fill_in "Measurement date", with: @measurement.measurement_date
    fill_in "Notes", with: @measurement.notes
    fill_in "Value", with: @measurement.value
    click_on "Create Measurement"

    assert_text "Measurement was successfully created"
    click_on "Back"
  end

  test "should update Measurement" do
    visit measurement_url(@measurement)
    click_on "Edit this measurement", match: :first

    fill_in "Experiment", with: @measurement.experiment_id
    fill_in "Kvm", with: @measurement.kvm_id
    fill_in "Measurement date", with: @measurement.measurement_date.to_s
    fill_in "Notes", with: @measurement.notes
    fill_in "Value", with: @measurement.value
    click_on "Update Measurement"

    assert_text "Measurement was successfully updated"
    click_on "Back"
  end

  test "should destroy Measurement" do
    visit measurement_url(@measurement)
    click_on "Destroy this measurement", match: :first

    assert_text "Measurement was successfully destroyed"
  end
end
