class Inventory::BuysController < ApplicationController
  before_action :authenticate_user!
  
  def index
  end

  def show
    @inventory_buy  =  Inventory::Buy.find(params[:id])
    @inventory_item = @inventory_buy.item
    @inventory_stock = @inventory_item.stocks.first
  end

  def new
  	@inventory_item =  Inventory::Item.find(params[:item_id])
  	@inventory_buy  =  Inventory::Buy.new
  end

  def create

    @inventory_buy =  Inventory::Buy.new(inventory_buy_params)

    if @inventory_buy.add(current_user)
      if @inventory_buy.add_stock
        redirect_to inventory_buy_path(@inventory_buy), flash: { alert: I18n.t("controllers.actions.message.save") }
      else
        flash[:error] = I18n.t("controllers.actions.message.err_save") 
        @inventory_item =  Inventory::Item.find(@inventory_buy.item_id)
        render :new        
      end
    else
      flash[:error] = I18n.t("controllers.actions.message.err_save") 
      @inventory_item =  Inventory::Item.find(@inventory_buy.item_id)
      render :new
    end

  end

private
    def inventory_buy_params
      params.require(:inventory_buy).permit(:description, :quantity, :buyprice, :cdate_on, :item_id)
    end

end
