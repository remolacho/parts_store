class Stock < ActiveRecord::Base
  include Audit
  belongs_to :item

  validates_presence_of       :item_id, message: I18n.t('models.inventory.stock.messages.presence_item')
  validates_numericality_of   :existence, message: I18n.t('models.inventory.stock.messages.alone_numbers')
  validates_numericality_of   :existence , :greater_than_or_equal_to => 0, message: I18n.t('models.inventory.stock.messages.greater_existence')
  
end
