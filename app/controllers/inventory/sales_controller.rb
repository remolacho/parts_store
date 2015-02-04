class Inventory::SalesController < ApplicationController
  before_action :set_inventory_sale, only: [:show, :edit, :update, :destroy]

  def index
    @inventory_sales = Sale.all
  end

  def show
  end

  def new
    @inventory_sale = Sale.new
    @inventory_item = Item.find(params[:item_id])
  end

  def edit
  end

  def create
    @inventory_sale = Sale.new(inventory_sale_params)
    if @inventory_sale.add(nil)
       redirect_to inventory_sale_path(@inventory_sale), flash: { alert: I18n.t("controllers.actions.message.save") }
    else
      flash[:error] = I18n.t("controllers.actions.message.err_save") 
      @inventory_item = Item.find(@inventory_sale.item_id)
      render :new
    end
  end

  def update
    
  end

  def destroy
    @inventory_sale.destroy
    
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_inventory_sale
      @inventory_sale = Sale.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def inventory_sale_params
      params.require(:sale).permit(:quantity, :cdate_on, :amount, :item_id)
    end
end
