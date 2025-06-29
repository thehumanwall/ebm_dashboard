require "test_helper"

class KvmsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @kvm = kvms(:one)
  end

  test "should get index" do
    get kvms_url
    assert_response :success
  end

  test "should get new" do
    get new_kvm_url
    assert_response :success
  end

  test "should create kvm" do
    assert_difference("Kvm.count") do
      post kvms_url, params: { kvm: { description: @kvm.description, is_active: @kvm.is_active, kva_id: @kvm.kva_id, name: @kvm.name, organization_id: @kvm.organization_id, unit_of_measure: @kvm.unit_of_measure } }
    end

    assert_redirected_to kvm_url(Kvm.last)
  end

  test "should show kvm" do
    get kvm_url(@kvm)
    assert_response :success
  end

  test "should get edit" do
    get edit_kvm_url(@kvm)
    assert_response :success
  end

  test "should update kvm" do
    patch kvm_url(@kvm), params: { kvm: { description: @kvm.description, is_active: @kvm.is_active, kva_id: @kvm.kva_id, name: @kvm.name, organization_id: @kvm.organization_id, unit_of_measure: @kvm.unit_of_measure } }
    assert_redirected_to kvm_url(@kvm)
  end

  test "should destroy kvm" do
    assert_difference("Kvm.count", -1) do
      delete kvm_url(@kvm)
    end

    assert_redirected_to kvms_url
  end
end
