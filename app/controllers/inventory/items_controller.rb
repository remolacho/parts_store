class Inventory::ItemsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_inventory_item, only: [:show, :edit, :update, :destroy]
  before_action :validate_not_close_daily, only: [:index]
  # GET /inventory/items
  def index
    
    begin
      @search =  Item.includes(:category, :stocks).all.search(params[:q])
      @inventory_items = @search.result
    rescue Exception => e
      @search =  Item.includes(:category, :stocks).all.search(params[:q])
      @inventory_items = @search.result
    end
    
    respond_to do |format|
      format.html { render :index}
      format.js { render :index }
    end

  end

  # GET /inventory/items/1
  def show
  end

  # GET /inventory/items/new
  def new
    begin
      @inventory_item = Item.new
      @categories = Category.all
    rescue Exception => e
      @inventory_item = Item.new
      @categories = Category.all
    end
  end

  # GET /inventory/items/1/edit
  def edit
    begin
      @categories = Category.all
    rescue Exception => e
      @categories = Category.all
    end
  end

  # POST /inventory/items
  def create

    @inventory_item = Item.new(inventory_item_params)

    if @inventory_item.add(current_user)
      redirect_to inventory_items_path, flash: { alert: I18n.t("controllers.actions.message.save") }
    else
      flash[:error] = I18n.t("controllers.actions.message.err_save") 
      @categories = Category.all
      render :new 
    end

  end

  # PATCH/PUT /inventory/items/1
  def update
      if @inventory_item.change(inventory_item_params, current_user)
        redirect_to inventory_item_path(@inventory_item), flash: { alert: I18n.t("controllers.actions.message.update") }
      else
        flash[:error] = I18n.t("controllers.actions.message.err_update")
        @categories = Category.all
        render :edit
      end
  end

  # DELETE /inventory/items/1
  def destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_inventory_item
      begin
        @inventory_item = Item.find(params[:id])
      rescue Exception => e
        @inventory_item = Item.find(params[:id])
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def inventory_item_params
      params.require(:item).permit(:name, :description, :costprice, :saleprice, :status, :cdate_on, :category_id)
    end
end
