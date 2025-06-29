require "application_system_test_case"

class KvasTest < ApplicationSystemTestCase
  setup do
    @kva = kvas(:one)
  end

  test "visiting the index" do
    visit kvas_url
    assert_selector "h1", text: "Kvas"
  end

  test "should create kva" do
    visit kvas_url
    click_on "New kva"

    fill_in "Description", with: @kva.description
    fill_in "Name", with: @kva.name
    click_on "Create Kva"

    assert_text "Kva was successfully created"
    click_on "Back"
  end

  test "should update Kva" do
    visit kva_url(@kva)
    click_on "Edit this kva", match: :first

    fill_in "Description", with: @kva.description
    fill_in "Name", with: @kva.name
    click_on "Update Kva"

    assert_text "Kva was successfully updated"
    click_on "Back"
  end

  test "should destroy Kva" do
    visit kva_url(@kva)
    click_on "Destroy this kva", match: :first

    assert_text "Kva was successfully destroyed"
  end
end
