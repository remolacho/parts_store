class Sale < ActiveRecord::Base
	include Audit
	belongs_to :item

    validates_presence_of       :amount, message: I18n.t('models.inventory.sale.messages.presence_amount')
	validates_presence_of       :quantity, message: I18n.t('models.inventory.sale.messages.presence_quantity')
	validates_presence_of       :item_id, message: I18n.t('models.inventory.sale.messages.presence_item')
    validates_numericality_of   :amount, :quantity, message: I18n.t('models.inventory.sale.messages.alone_numbers')
    validates_numericality_of   :amount , :greater_than_or_equal_to => 100, message: I18n.t('models.inventory.item.messages.greater_amount')
    validates_numericality_of   :quantity, :greater_than_or_equal_to => 1, message: I18n.t('models.inventory.item.messages.greater_quantity')

end
