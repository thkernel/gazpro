require "test_helper"

class ProductionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @production = productions(:one)
  end

  test "should get index" do
    get productions_url
    assert_response :success
  end

  test "should get new" do
    get new_production_url
    assert_response :success
  end

  test "should create production" do
    assert_difference('Production.count') do
      post productions_url, params: { production: { account_id: @production.account_id, b12_number: @production.b12_number, b12_tonnage: @production.b12_tonnage, b32_number: @production.b32_number, b32_tonnage: @production.b32_tonnage, b38_number: @production.b38_number, b38_tonnage: @production.b38_tonnage, b3_number: @production.b3_number, b3_tonnage: @production.b3_tonnage, b6_number: @production.b6_number, b6_tonnage: @production.b6_tonnage, production_date: @production.production_date, quantity: @production.quantity, status: @production.status, total_tonnage: @production.total_tonnage, uid: @production.uid } }
    end

    assert_redirected_to production_url(Production.last)
  end

  test "should show production" do
    get production_url(@production)
    assert_response :success
  end

  test "should get edit" do
    get edit_production_url(@production)
    assert_response :success
  end

  test "should update production" do
    patch production_url(@production), params: { production: { account_id: @production.account_id, b12_number: @production.b12_number, b12_tonnage: @production.b12_tonnage, b32_number: @production.b32_number, b32_tonnage: @production.b32_tonnage, b38_number: @production.b38_number, b38_tonnage: @production.b38_tonnage, b3_number: @production.b3_number, b3_tonnage: @production.b3_tonnage, b6_number: @production.b6_number, b6_tonnage: @production.b6_tonnage, production_date: @production.production_date, quantity: @production.quantity, status: @production.status, total_tonnage: @production.total_tonnage, uid: @production.uid } }
    assert_redirected_to production_url(@production)
  end

  test "should destroy production" do
    assert_difference('Production.count', -1) do
      delete production_url(@production)
    end

    assert_redirected_to productions_url
  end
end
