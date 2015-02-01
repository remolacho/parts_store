class Inventory::ItemsController < ApplicationController
  before_action :set_inventory_item, only: [:show, :edit, :update, :destroy]

  # GET /inventory/items
  def index
    @inventory_items =Item.includes(:category).all
  end

  # GET /inventory/items/1
  def show
  end

  # GET /inventory/items/new
  def new
    @inventory_item = Item.new
  end

  # GET /inventory/items/1/edit
  def edit
  end

  # POST /inventory/items
  def create

    @inventory_item = Item.new(inventory_item_params)

    respond_to do |format|
      if @inventory_item.save
        format.html { redirect_to inventory_items_path, notice: 'Item was successfully created.' }
      else
        format.html { render :new }
      end
    end

  end

  # PATCH/PUT /inventory/items/1
  def update
    respond_to do |format|
      if @inventory_item.update(inventory_item_params)
        format.html { redirect_to inventory_item_path @inventory_item, notice: 'Item was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /inventory/items/1
  def destroy
    @inventory_item.destroy
    respond_to do |format|
      format.html { redirect_to inventory_items_path, notice: 'Item was successfully destroyed.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_inventory_item
      @inventory_item = Item.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def inventory_item_params
      params.require(:item).permit(:name, :description, :costprice, :saleprice, :status, :cdate, :category_id)
    end
end
