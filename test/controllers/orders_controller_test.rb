require "test_helper"

class OrdersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @order = orders(:one)
  end

  test "should get index" do
    get orders_url
    assert_response :success
  end

  test "should get new" do
    get new_order_url
    assert_response :success
  end

  test "should create order" do
    assert_difference('Order.count') do
      post orders_url, params: { order: { account_id: @order.account_id, customer_id: @order.customer_id, delivery_note_number: @order.delivery_note_number, entry_32: @order.entry_32, entry_b12: @order.entry_b12, entry_b3: @order.entry_b3, entry_b38: @order.entry_b38, entry_b6: @order.entry_b6, order_date: @order.order_date, status: @order.status, total_tonnage: @order.total_tonnage, transporter: @order.transporter, uid: @order.uid } }
    end

    assert_redirected_to order_url(Order.last)
  end

  test "should show order" do
    get order_url(@order)
    assert_response :success
  end

  test "should get edit" do
    get edit_order_url(@order)
    assert_response :success
  end

  test "should update order" do
    patch order_url(@order), params: { order: { account_id: @order.account_id, customer_id: @order.customer_id, delivery_note_number: @order.delivery_note_number, entry_32: @order.entry_32, entry_b12: @order.entry_b12, entry_b3: @order.entry_b3, entry_b38: @order.entry_b38, entry_b6: @order.entry_b6, order_date: @order.order_date, status: @order.status, total_tonnage: @order.total_tonnage, transporter: @order.transporter, uid: @order.uid } }
    assert_redirected_to order_url(@order)
  end

  test "should destroy order" do
    assert_difference('Order.count', -1) do
      delete order_url(@order)
    end

    assert_redirected_to orders_url
  end
end
