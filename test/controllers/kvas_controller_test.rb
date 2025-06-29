require "test_helper"

class KvasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @kva = kvas(:one)
  end

  test "should get index" do
    get kvas_url
    assert_response :success
  end

  test "should get new" do
    get new_kva_url
    assert_response :success
  end

  test "should create kva" do
    assert_difference("Kva.count") do
      post kvas_url, params: { kva: { description: @kva.description, name: @kva.name } }
    end

    assert_redirected_to kva_url(Kva.last)
  end

  test "should show kva" do
    get kva_url(@kva)
    assert_response :success
  end

  test "should get edit" do
    get edit_kva_url(@kva)
    assert_response :success
  end

  test "should update kva" do
    patch kva_url(@kva), params: { kva: { description: @kva.description, name: @kva.name } }
    assert_redirected_to kva_url(@kva)
  end

  test "should destroy kva" do
    assert_difference("Kva.count", -1) do
      delete kva_url(@kva)
    end

    assert_redirected_to kvas_url
  end
end
