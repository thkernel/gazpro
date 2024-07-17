require "application_system_test_case"

class ProductionsTest < ApplicationSystemTestCase
  setup do
    @production = productions(:one)
  end

  test "visiting the index" do
    visit productions_url
    assert_selector "h1", text: "Productions"
  end

  test "creating a Production" do
    visit productions_url
    click_on "New Production"

    fill_in "Account", with: @production.account_id
    fill_in "B12 number", with: @production.b12_number
    fill_in "B12 tonnage", with: @production.b12_tonnage
    fill_in "B32 number", with: @production.b32_number
    fill_in "B32 tonnage", with: @production.b32_tonnage
    fill_in "B38 number", with: @production.b38_number
    fill_in "B38 tonnage", with: @production.b38_tonnage
    fill_in "B3 number", with: @production.b3_number
    fill_in "B3 tonnage", with: @production.b3_tonnage
    fill_in "B6 number", with: @production.b6_number
    fill_in "B6 tonnage", with: @production.b6_tonnage
    fill_in "Production date", with: @production.production_date
    fill_in "Quantity", with: @production.quantity
    fill_in "Status", with: @production.status
    fill_in "Total tonnage", with: @production.total_tonnage
    fill_in "Uid", with: @production.uid
    click_on "Create Production"

    assert_text "Production was successfully created"
    click_on "Back"
  end

  test "updating a Production" do
    visit productions_url
    click_on "Edit", match: :first

    fill_in "Account", with: @production.account_id
    fill_in "B12 number", with: @production.b12_number
    fill_in "B12 tonnage", with: @production.b12_tonnage
    fill_in "B32 number", with: @production.b32_number
    fill_in "B32 tonnage", with: @production.b32_tonnage
    fill_in "B38 number", with: @production.b38_number
    fill_in "B38 tonnage", with: @production.b38_tonnage
    fill_in "B3 number", with: @production.b3_number
    fill_in "B3 tonnage", with: @production.b3_tonnage
    fill_in "B6 number", with: @production.b6_number
    fill_in "B6 tonnage", with: @production.b6_tonnage
    fill_in "Production date", with: @production.production_date
    fill_in "Quantity", with: @production.quantity
    fill_in "Status", with: @production.status
    fill_in "Total tonnage", with: @production.total_tonnage
    fill_in "Uid", with: @production.uid
    click_on "Update Production"

    assert_text "Production was successfully updated"
    click_on "Back"
  end

  test "destroying a Production" do
    visit productions_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Production was successfully destroyed"
  end
end
