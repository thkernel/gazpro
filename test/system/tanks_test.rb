require "application_system_test_case"

class TanksTest < ApplicationSystemTestCase
  setup do
    @tank = tanks(:one)
  end

  test "visiting the index" do
    visit tanks_url
    assert_selector "h1", text: "Tanks"
  end

  test "creating a Tank" do
    visit tanks_url
    click_on "New Tank"

    fill_in "Account", with: @tank.account_id
    fill_in "Brand", with: @tank.brand
    fill_in "Capacity", with: @tank.capacity
    fill_in "Description", with: @tank.description
    fill_in "Model", with: @tank.model
    fill_in "Registration number", with: @tank.registration_number
    fill_in "Status", with: @tank.status
    fill_in "Uid", with: @tank.uid
    fill_in "Unity", with: @tank.unity_id
    click_on "Create Tank"

    assert_text "Tank was successfully created"
    click_on "Back"
  end

  test "updating a Tank" do
    visit tanks_url
    click_on "Edit", match: :first

    fill_in "Account", with: @tank.account_id
    fill_in "Brand", with: @tank.brand
    fill_in "Capacity", with: @tank.capacity
    fill_in "Description", with: @tank.description
    fill_in "Model", with: @tank.model
    fill_in "Registration number", with: @tank.registration_number
    fill_in "Status", with: @tank.status
    fill_in "Uid", with: @tank.uid
    fill_in "Unity", with: @tank.unity_id
    click_on "Update Tank"

    assert_text "Tank was successfully updated"
    click_on "Back"
  end

  test "destroying a Tank" do
    visit tanks_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Tank was successfully destroyed"
  end
end
