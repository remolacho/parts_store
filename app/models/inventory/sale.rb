class Sale < ActiveRecord::Base
	include Audit
	belongs_to :item
  belongs_to :dailysale
  
    validates_presence_of       :amount, message: I18n.t('models.inventory.sale.messages.presence_amount')
	  validates_presence_of       :quantity, message: I18n.t('models.inventory.sale.messages.presence_quantity')
	  validates_presence_of       :item_id, message: I18n.t('models.inventory.sale.messages.presence_item')
    validates_numericality_of   :amount, :quantity, message: I18n.t('models.inventory.sale.messages.alone_numbers')
    validates_numericality_of   :amount , :greater_than_or_equal_to => 100, message: I18n.t('models.inventory.sale.messages.greater_amount')
    validates_numericality_of   :quantity, :greater_than_or_equal_to => 1, message: I18n.t('models.inventory.sale.messages.greater_quantity')
    validate                    :validate_stock, :create_or_find_dailysale

private

  def create_or_find_dailysale
    begin
      dailysale = Dailysale.find_by(status: "A", cdate_on: Time.new.strftime("%Y-%m-%d"))
      dailysale = Dailysale.create(cdate_on: Time.now) unless dailysale
      self.dailysale_id = dailysale.id
    rescue Exception => e
      errors.add(:dailysale, "#{I18n.t('models.inventory.sale.messages.exception_dailysale')} #{e.to_s}"); false
    end
  end

  def validate_stock
  	begin
  	  stock = Stock.find_by(item_id: self.item_id)
  	  total = stock.existence - self.quantity
  	  total >= 0 ? true : errors.add(:existence, I18n.t('models.inventory.sale.messages.validate_stock')); false  
  	rescue Exception => e
  	  errors.add(:quantity, I18n.t('models.inventory.sale.messages.exception_stock')); false
  	end
  end

public
  def saleInStock
     begin
        inventory_stock = Stock.find_by(item_id: self.item_id)
        inventory_stock.udate_on = Time.now
        inventory_stock.existence_back = inventory_stock.existence
        inventory_stock.existence -= self.quantity
        inventory_stock.alter(nil)  
     rescue Exception => e
        self.destroy
        errors.add(:saleInStock, I18n.t('models.inventory.sale.messages.err_sale_stock')); false
     end
  end

  def restore_stock
     begin
        inventory_stock = Stock.find_by(item_id: self.item_id)
        inventory_stock.udate_on = Time.now
        inventory_stock.existence_back = inventory_stock.existence
        inventory_stock.existence += self.quantity
        inventory_stock.alter(nil)  
     rescue Exception => e
        errors.add(:saleInStock, I18n.t('models.inventory.sale.messages.err_sale_stock')); false
     end
  end

  def rollback_stock
     begin
        inventory_stock = Stock.find_by(item_id: self.item_id)
        inventory_stock.udate_on = Time.now
        inventory_stock.existence_back = inventory_stock.existence
        inventory_stock.existence -= self.quantity
        inventory_stock.alter(nil)  
     rescue Exception => e
        errors.add(:saleInStock, I18n.t('models.inventory.sale.messages.err_sale_stock')); false
     end
  end

end
