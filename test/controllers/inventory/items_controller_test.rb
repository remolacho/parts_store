require 'test_helper'

class Inventory::ItemsControllerTest < ActionController::TestCase
  setup do
    @inventory_item = inventory_items(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:inventory_items)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create inventory_item" do
    assert_difference('Inventory::Item.count') do
      post :create, inventory_item: { belongs_to: @inventory_item.belongs_to, category: @inventory_item.category, cdate: @inventory_item.cdate, costprice: @inventory_item.costprice, description: @inventory_item.description, name: @inventory_item.name, saleprice: @inventory_item.saleprice, status: @inventory_item.status }
    end

    assert_redirected_to inventory_item_path(assigns(:inventory_item))
  end

  test "should show inventory_item" do
    get :show, id: @inventory_item
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @inventory_item
    assert_response :success
  end

  test "should update inventory_item" do
    patch :update, id: @inventory_item, inventory_item: { belongs_to: @inventory_item.belongs_to, category: @inventory_item.category, cdate: @inventory_item.cdate, costprice: @inventory_item.costprice, description: @inventory_item.description, name: @inventory_item.name, saleprice: @inventory_item.saleprice, status: @inventory_item.status }
    assert_redirected_to inventory_item_path(assigns(:inventory_item))
  end

  test "should destroy inventory_item" do
    assert_difference('Inventory::Item.count', -1) do
      delete :destroy, id: @inventory_item
    end

    assert_redirected_to inventory_items_path
  end
end
