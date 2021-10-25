require "test_helper"

class ObjetoAcuaticosControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get objeto_acuaticos_index_url
    assert_response :success
  end

  test "should get show" do
    get objeto_acuaticos_show_url
    assert_response :success
  end

  test "should get create" do
    get objeto_acuaticos_create_url
    assert_response :success
  end

  test "should get new" do
    get objeto_acuaticos_new_url
    assert_response :success
  end
end
