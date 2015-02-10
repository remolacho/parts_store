class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

public 
  def validate_daily_close
     daily_close =  Inventory::Dailysale.where(status: "C",cdate_on: Time.new.strftime("%Y-%m-%d")).count
     redirect_to inventory_items_path, flash: { alert: I18n.t("controllers.actions.message.save_daily_close") }  if daily_close > 0  
  end

  def validate_not_close_daily
     daily_open =  Inventory::Dailysale.where(status: "A").less_date(Time.new.strftime("%Y-%m-%d")).count
     redirect_to inventory_dailysales_path if daily_open > 0 
  end
end
