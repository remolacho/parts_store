class Inventory::DailyclosuresController < ApplicationController
  before_action :authenticate_user!
  before_action :validate_daily_close, only: [:create]

  def index
    
    if params[:q]
      @search =  Dailyclosure.all.search(params[:q])
      @inventory_dc = @search.result.page(params[:page]).per(12)
    else
      @search =  Dailyclosure.between((Time.now - 1.month).strftime("%Y-%m-%d"),Time.now.strftime("%Y-%m-%d")).search(params[:q])
      @inventory_dc = @search.result.page(params[:page]).per(12)
    end

    respond_to do |format|
      format.html { render :index}
      format.js { render :index }
    end

  end

  def create
  	 begin
  	   daily_close = Dailyclosure.new (inventory_dailyclosure_params)
       if daily_close.add(current_user)
     	   redirect_to inventory_items_path, flash: { alert: I18n.t("controllers.actions.message.save_daily_close") } 
       else
      	 redirect_to inventory_sales_path, flash: { error: "#{I18n.t('controllers.actions.message.err_daily_close')} #{daily_close.errors.first}" } 
       end	
  	 rescue Exception => e
  	 	 redirect_to inventory_sales_path, flash: { error: "#{e.to_s} intente nuevamente"} 
  	 end
  end

private
    def inventory_dailyclosure_params
      params.require(:dailyclosure).permit(:total_amount_sale, :total_amount_cost, :total_amount_gain, :cdate_on, :dailysale_id)
    end
end
