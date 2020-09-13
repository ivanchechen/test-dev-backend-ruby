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

    fill_in "City", with: @order.city
    fill_in "Complement", with: @order.complement
    fill_in "Country", with: @order.country
    fill_in "Customer", with: @order.customer_id
    fill_in "Deliveryfee", with: @order.deliveryFee
    fill_in "District", with: @order.district
    fill_in "Dtordercreate", with: @order.dtOrderCreate
    fill_in "Externalcode", with: @order.externalCode
    fill_in "Latitude", with: @order.latitude
    fill_in "Longitude", with: @order.longitude
    fill_in "Number", with: @order.number
    fill_in "Postalcode", with: @order.postalCode
    fill_in "State", with: @order.state
    fill_in "Storeid", with: @order.storeId
    fill_in "Street", with: @order.street
    fill_in "Subtotal", with: @order.subTotal
    fill_in "Total", with: @order.total
    click_on "Create Order"

    assert_text "Order was successfully created"
    click_on "Back"
  end

  test "updating a Order" do
    visit orders_url
    click_on "Edit", match: :first

    fill_in "City", with: @order.city
    fill_in "Complement", with: @order.complement
    fill_in "Country", with: @order.country
    fill_in "Customer", with: @order.customer_id
    fill_in "Deliveryfee", with: @order.deliveryFee
    fill_in "District", with: @order.district
    fill_in "Dtordercreate", with: @order.dtOrderCreate
    fill_in "Externalcode", with: @order.externalCode
    fill_in "Latitude", with: @order.latitude
    fill_in "Longitude", with: @order.longitude
    fill_in "Number", with: @order.number
    fill_in "Postalcode", with: @order.postalCode
    fill_in "State", with: @order.state
    fill_in "Storeid", with: @order.storeId
    fill_in "Street", with: @order.street
    fill_in "Subtotal", with: @order.subTotal
    fill_in "Total", with: @order.total
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
