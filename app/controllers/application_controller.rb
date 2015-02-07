class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :validate_not_close_daily

public 
  def validate_daily_close
     daily_close = Dailyclosure.where(cdate_on: Time.new.strftime("%Y-%m-%d")).count
     redirect_to inventory_items_path, flash: { alert: I18n.t("controllers.actions.message.save_daily_close") }  if daily_close > 0  
  end

  def validate_not_close_daily
     #sales = Sale.where(cdate_on: Time.now.strftime("%Y-%m-%d").to_date - 1.day ).count
     #if sales > 0
     #   daily_close = Dailyclosure..where(cdate_on: Time.now.strftime("%Y-%m-%d").to_date - 1.day ).count 
     #   redirect_to inventory_items_path, flash: { alert: I18n.t("controllers.actions.message.not_save_daily_close") } unless daily_close > 0
     #end
  end
end
