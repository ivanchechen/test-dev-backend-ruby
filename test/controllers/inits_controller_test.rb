require 'test_helper'

class InitsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @init = inits(:one)
  end

  test "should get index" do
    get inits_url
    assert_response :success
  end

  test "should get new" do
    get new_init_url
    assert_response :success
  end

  test "should create init" do
    assert_difference('Init.count') do
      post inits_url, params: { init: { entrada: @init.entrada } }
    end

    assert_redirected_to init_url(Init.last)
  end

  test "should show init" do
    get init_url(@init)
    assert_response :success
  end

  test "should get edit" do
    get edit_init_url(@init)
    assert_response :success
  end

  test "should update init" do
    patch init_url(@init), params: { init: { entrada: @init.entrada } }
    assert_redirected_to init_url(@init)
  end

  test "should destroy init" do
    assert_difference('Init.count', -1) do
      delete init_url(@init)
    end

    assert_redirected_to inits_url
  end
end
