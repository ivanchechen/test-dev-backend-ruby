require 'test_helper'

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
      post orders_url, params: { order: { city: @order.city, complement: @order.complement, country: @order.country, customer_id: @order.customer_id, deliveryFee: @order.deliveryFee, district: @order.district, dtOrderCreate: @order.dtOrderCreate, externalCode: @order.externalCode, latitude: @order.latitude, longitude: @order.longitude, number: @order.number, postalCode: @order.postalCode, state: @order.state, storeId: @order.storeId, street: @order.street, subTotal: @order.subTotal, total: @order.total } }
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
    patch order_url(@order), params: { order: { city: @order.city, complement: @order.complement, country: @order.country, customer_id: @order.customer_id, deliveryFee: @order.deliveryFee, district: @order.district, dtOrderCreate: @order.dtOrderCreate, externalCode: @order.externalCode, latitude: @order.latitude, longitude: @order.longitude, number: @order.number, postalCode: @order.postalCode, state: @order.state, storeId: @order.storeId, street: @order.street, subTotal: @order.subTotal, total: @order.total } }
    assert_redirected_to order_url(@order)
  end

  test "should destroy order" do
    assert_difference('Order.count', -1) do
      delete order_url(@order)
    end

    assert_redirected_to orders_url
  end
end
