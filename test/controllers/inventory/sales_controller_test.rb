require 'test_helper'

class Inventory::SalesControllerTest < ActionController::TestCase
  setup do
    @inventory_sale = inventory_sales(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:inventory_sales)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create inventory_sale" do
    assert_difference('Inventory::Sale.count') do
      post :create, inventory_sale: { cdate_on: @inventory_sale.cdate_on, quantity: @inventory_sale.quantity }
    end

    assert_redirected_to inventory_sale_path(assigns(:inventory_sale))
  end

  test "should show inventory_sale" do
    get :show, id: @inventory_sale
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @inventory_sale
    assert_response :success
  end

  test "should update inventory_sale" do
    patch :update, id: @inventory_sale, inventory_sale: { cdate_on: @inventory_sale.cdate_on, quantity: @inventory_sale.quantity }
    assert_redirected_to inventory_sale_path(assigns(:inventory_sale))
  end

  test "should destroy inventory_sale" do
    assert_difference('Inventory::Sale.count', -1) do
      delete :destroy, id: @inventory_sale
    end

    assert_redirected_to inventory_sales_path
  end
end
