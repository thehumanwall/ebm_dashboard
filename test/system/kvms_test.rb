require "application_system_test_case"

class KvmsTest < ApplicationSystemTestCase
  setup do
    @kvm = kvms(:one)
  end

  test "visiting the index" do
    visit kvms_url
    assert_selector "h1", text: "Kvms"
  end

  test "should create kvm" do
    visit kvms_url
    click_on "New kvm"

    fill_in "Description", with: @kvm.description
    check "Is active" if @kvm.is_active
    fill_in "Kva", with: @kvm.kva_id
    fill_in "Name", with: @kvm.name
    fill_in "Organization", with: @kvm.organization_id
    fill_in "Unit of measure", with: @kvm.unit_of_measure
    click_on "Create Kvm"

    assert_text "Kvm was successfully created"
    click_on "Back"
  end

  test "should update Kvm" do
    visit kvm_url(@kvm)
    click_on "Edit this kvm", match: :first

    fill_in "Description", with: @kvm.description
    check "Is active" if @kvm.is_active
    fill_in "Kva", with: @kvm.kva_id
    fill_in "Name", with: @kvm.name
    fill_in "Organization", with: @kvm.organization_id
    fill_in "Unit of measure", with: @kvm.unit_of_measure
    click_on "Update Kvm"

    assert_text "Kvm was successfully updated"
    click_on "Back"
  end

  test "should destroy Kvm" do
    visit kvm_url(@kvm)
    click_on "Destroy this kvm", match: :first

    assert_text "Kvm was successfully destroyed"
  end
end
