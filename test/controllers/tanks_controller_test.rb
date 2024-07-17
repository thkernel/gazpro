require "test_helper"

class TanksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @tank = tanks(:one)
  end

  test "should get index" do
    get tanks_url
    assert_response :success
  end

  test "should get new" do
    get new_tank_url
    assert_response :success
  end

  test "should create tank" do
    assert_difference('Tank.count') do
      post tanks_url, params: { tank: { account_id: @tank.account_id, brand: @tank.brand, capacity: @tank.capacity, description: @tank.description, model: @tank.model, registration_number: @tank.registration_number, status: @tank.status, uid: @tank.uid, unity_id: @tank.unity_id } }
    end

    assert_redirected_to tank_url(Tank.last)
  end

  test "should show tank" do
    get tank_url(@tank)
    assert_response :success
  end

  test "should get edit" do
    get edit_tank_url(@tank)
    assert_response :success
  end

  test "should update tank" do
    patch tank_url(@tank), params: { tank: { account_id: @tank.account_id, brand: @tank.brand, capacity: @tank.capacity, description: @tank.description, model: @tank.model, registration_number: @tank.registration_number, status: @tank.status, uid: @tank.uid, unity_id: @tank.unity_id } }
    assert_redirected_to tank_url(@tank)
  end

  test "should destroy tank" do
    assert_difference('Tank.count', -1) do
      delete tank_url(@tank)
    end

    assert_redirected_to tanks_url
  end
end
