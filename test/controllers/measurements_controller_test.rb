require "test_helper"

class MeasurementsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @measurement = measurements(:one)
  end

  test "should get index" do
    get measurements_url
    assert_response :success
  end

  test "should get new" do
    get new_measurement_url
    assert_response :success
  end

  test "should create measurement" do
    assert_difference("Measurement.count") do
      post measurements_url, params: { measurement: { experiment_id: @measurement.experiment_id, kvm_id: @measurement.kvm_id, measurement_date: @measurement.measurement_date, notes: @measurement.notes, value: @measurement.value } }
    end

    assert_redirected_to measurement_url(Measurement.last)
  end

  test "should show measurement" do
    get measurement_url(@measurement)
    assert_response :success
  end

  test "should get edit" do
    get edit_measurement_url(@measurement)
    assert_response :success
  end

  test "should update measurement" do
    patch measurement_url(@measurement), params: { measurement: { experiment_id: @measurement.experiment_id, kvm_id: @measurement.kvm_id, measurement_date: @measurement.measurement_date, notes: @measurement.notes, value: @measurement.value } }
    assert_redirected_to measurement_url(@measurement)
  end

  test "should destroy measurement" do
    assert_difference("Measurement.count", -1) do
      delete measurement_url(@measurement)
    end

    assert_redirected_to measurements_url
  end
end
