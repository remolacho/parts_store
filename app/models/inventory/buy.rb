class Buy < ActiveRecord::Base
	include Audit

	belongs_to :item

	validates_presence_of       :item_id, message: I18n.t('models.inventory.buy.messages.presence_item')
    validates_numericality_of   :buyprice, :quantity, message: I18n.t('models.inventory.buy.messages.alone_numbers')
    validates_numericality_of   :buyprice , :greater_than_or_equal_to => 100, message: I18n.t('models.inventory.item.messages.greater_buyprice')
    validates_numericality_of   :quantity , :greater_than_or_equal_to => 1, message: I18n.t('models.inventory.item.messages.greater_quantity')

end
