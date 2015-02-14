class Inventory::SalesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_inventory_sale, only: [:show, :edit, :update, :destroy]
  before_action :validate_not_close_daily, only: [:create, :destroy, :new]
  before_action :validate_daily_close, only: [:create, :destroy, :new]
  
  def index
    @inventory_sales =  Inventory::Sale.includes(:item,:dailysale).where(cdate_on: Time.new.strftime("%Y-%m-%d")).order(id: :desc)
  end

  def show
     @inventory_item = @inventory_sale.item
     @inventory_stock = @inventory_item.stocks.first
  end

  def new
    @inventory_sale =  Inventory::Sale.new
    @inventory_item =  Inventory::Item.find(params[:item_id])
    @inventory_stock = @inventory_item.stocks.first
  end

  def edit
  end

  def create
    @inventory_sale =  Inventory::Sale.new(inventory_sale_params)
    if @inventory_sale.add(current_user)
       if @inventory_sale.saleInStock
         redirect_to inventory_sale_path(@inventory_sale), flash: { alert: I18n.t("controllers.actions.message.save") }
       else
          flash[:error] = I18n.t("controllers.actions.message.err_save") 
          @inventory_item =  Inventory::Item.find(@inventory_sale.item_id)
          @inventory_stock = @inventory_item.stocks.first
          render :new
       end
    else
      flash[:error] = I18n.t("controllers.actions.message.err_save") 
      @inventory_item =  Inventory::Item.find(@inventory_sale.item_id)
      @inventory_stock = @inventory_item.stocks.first
      render :new
    end
  end

  def update
    
  end

  def destroy

    if @inventory_sale.restore_stock
  
      begin
        @inventory_sale.destroy
        redirect_to inventory_sales_path, flash: { alert: I18n.t("controllers.actions.message.restore_stock") }
      rescue Exception => e
         @inventory_sale.rollback_stock
         redirect_to inventory_sales_path, flash: { error: I18n.t("controllers.actions.message.err_restore_stock") }
      end
  
    else
      redirect_to inventory_sales_path, flash: { error: I18n.t("controllers.actions.message.err_restore_stock") }
    end

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_inventory_sale
      @inventory_sale =  Inventory::Sale.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def inventory_sale_params
      params.require(:inventory_sale).permit(:quantity, :cdate_on, :amount, :item_id, :dailysale_id)
    end
end
