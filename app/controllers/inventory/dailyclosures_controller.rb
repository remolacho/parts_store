class Inventory::DailyclosuresController < ApplicationController
  
  before_action :validate_daily_close, only: [:create]

  def index
  end

  def create
  	 begin
  	   daily_close = Dailyclosure.new (inventory_dailyclosure_params)
       if daily_close.add(nil)
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
      params.require(:dailyclosure).permit(:total_sale, :total_cost, :total_gain, :cdate_on, :dailysale_id)
    end
end
