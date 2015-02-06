class Dailyclosure < ActiveRecord::Base
	include Audit
    validate :daily_sales

private
  def daily_sales
  	begin
  	  sales = Sale.where(cdate_on: Time.new.strftime("%Y-%m-%d")).count
  	  sales > 0 ? true : errors.add(:daily_sales, I18n.t('models.inventory.dailyclosure.messages.err_daily_sales')); false  
  	rescue Exception => e
  	  errors.add(:daily_sales, e.to_s); false
  	end
  end

end
