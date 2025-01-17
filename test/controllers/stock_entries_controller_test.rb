require "test_helper"

class StockEntriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @stock_entry = stock_entries(:one)
  end

  test "should get index" do
    get stock_entries_url
    assert_response :success
  end

  test "should get new" do
    get new_stock_entry_url
    assert_response :success
  end

  test "should create stock_entry" do
    assert_difference('StockEntry.count') do
      post stock_entries_url, params: { stock_entry: { account_id: @stock_entry.account_id, delivery_note_number: @stock_entry.delivery_note_number, description: @stock_entry.description, driver: @stock_entry.driver, product_id: @stock_entry.product_id, quantity: @stock_entry.quantity, receipt_date: @stock_entry.receipt_date, status: @stock_entry.status, tank_id: @stock_entry.tank_id, uid: @stock_entry.uid, unity_id: @stock_entry.unity_id } }
    end

    assert_redirected_to stock_entry_url(StockEntry.last)
  end

  test "should show stock_entry" do
    get stock_entry_url(@stock_entry)
    assert_response :success
  end

  test "should get edit" do
    get edit_stock_entry_url(@stock_entry)
    assert_response :success
  end

  test "should update stock_entry" do
    patch stock_entry_url(@stock_entry), params: { stock_entry: { account_id: @stock_entry.account_id, delivery_note_number: @stock_entry.delivery_note_number, description: @stock_entry.description, driver: @stock_entry.driver, product_id: @stock_entry.product_id, quantity: @stock_entry.quantity, receipt_date: @stock_entry.receipt_date, status: @stock_entry.status, tank_id: @stock_entry.tank_id, uid: @stock_entry.uid, unity_id: @stock_entry.unity_id } }
    assert_redirected_to stock_entry_url(@stock_entry)
  end

  test "should destroy stock_entry" do
    assert_difference('StockEntry.count', -1) do
      delete stock_entry_url(@stock_entry)
    end

    assert_redirected_to stock_entries_url
  end
end
