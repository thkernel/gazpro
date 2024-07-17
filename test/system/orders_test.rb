require "application_system_test_case"

class OrdersTest < ApplicationSystemTestCase
  setup do
    @order = orders(:one)
  end

  test "visiting the index" do
    visit orders_url
    assert_selector "h1", text: "Orders"
  end

  test "creating a Order" do
    visit orders_url
    click_on "New Order"

    fill_in "Account", with: @order.account_id
    fill_in "Customer", with: @order.customer_id
    fill_in "Delivery note number", with: @order.delivery_note_number
    fill_in "Entry 32", with: @order.entry_32
    fill_in "Entry b12", with: @order.entry_b12
    fill_in "Entry b3", with: @order.entry_b3
    fill_in "Entry b38", with: @order.entry_b38
    fill_in "Entry b6", with: @order.entry_b6
    fill_in "Order date", with: @order.order_date
    fill_in "Status", with: @order.status
    fill_in "Total tonnage", with: @order.total_tonnage
    fill_in "Transporter", with: @order.transporter
    fill_in "Uid", with: @order.uid
    click_on "Create Order"

    assert_text "Order was successfully created"
    click_on "Back"
  end

  test "updating a Order" do
    visit orders_url
    click_on "Edit", match: :first

    fill_in "Account", with: @order.account_id
    fill_in "Customer", with: @order.customer_id
    fill_in "Delivery note number", with: @order.delivery_note_number
    fill_in "Entry 32", with: @order.entry_32
    fill_in "Entry b12", with: @order.entry_b12
    fill_in "Entry b3", with: @order.entry_b3
    fill_in "Entry b38", with: @order.entry_b38
    fill_in "Entry b6", with: @order.entry_b6
    fill_in "Order date", with: @order.order_date
    fill_in "Status", with: @order.status
    fill_in "Total tonnage", with: @order.total_tonnage
    fill_in "Transporter", with: @order.transporter
    fill_in "Uid", with: @order.uid
    click_on "Update Order"

    assert_text "Order was successfully updated"
    click_on "Back"
  end

  test "destroying a Order" do
    visit orders_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Order was successfully destroyed"
  end
end
