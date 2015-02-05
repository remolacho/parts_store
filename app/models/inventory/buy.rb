class Buy < ActiveRecord::Base
	include Audit

	belongs_to :item

	validates_presence_of       :item_id, message: I18n.t('models.inventory.buy.messages.presence_item')
  validates_numericality_of   :buyprice, :quantity, message: I18n.t('models.inventory.buy.messages.alone_numbers')
  validates_numericality_of   :buyprice , :greater_than_or_equal_to => 100, message: I18n.t('models.inventory.buy.messages.greater_buyprice')
  validates_numericality_of   :quantity , :greater_than_or_equal_to => 1, message: I18n.t('models.inventory.buy.messages.greater_quantity')
  validates_numericality_of   :quantity , :less_than_or_equal_to => 1000, message: I18n.t('models.inventory.buy.messages.less_quantity')

public 
  def add_stock
    begin
      inventory_stock = Stock.find_by(item_id: self.item_id)
      if inventory_stock
        inventory_stock.udate_on = Time.now
        inventory_stock.existence_back = inventory_stock.existence
        inventory_stock.existence += self.quantity
        inventory_stock.alter(nil)
      else
        inventory_stock = Stock.new(item_id: self.item_id, existence: self.quantity, existence_back: 0, cdate_on: Time.now, udate_on: Time.now, status: "A")
        inventory_stock.add(nil)
      end 
    rescue Exception => e
        self.destroy
        errors.add(:add_stock, I18n.t('models.inventory.sale.messages.err_buy_stock')); false
    end


  end

end
