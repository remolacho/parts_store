class Dailyclosure < ActiveRecord::Base
	include Audit
  belongs_to :dailysale
  validate :daily_sales
    
  after_save :close_daily_sale

  scope :between, ->(from,to){
    where("cdate_on BETWEEN ? AND ?", from,to)
  }

private
  def daily_sales
  	begin
  	  sales = Dailysale.where(id: self.dailysale_id, status: "A").count
  	  sales > 0 ? true : errors.add(:daily_sales, I18n.t('models.inventory.dailyclosure.messages.err_daily_sales')); false  
  	rescue Exception => e
  	  errors.add(:daily_sales, e.to_s); false
  	end
  end

  def close_daily_sale
    begin
      dailysale = Dailysale.find(self.dailysale_id)
      self.destroy unless dailysale.update_attributes(status: "C") 
    rescue Exception => e
      self.destroy
      errors.add(:close_daily_sale, e.to_s); false
    end
  end

end
