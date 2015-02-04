class Item < ActiveRecord::Base
	include Audit
	
	belongs_to :category
    has_many :buys , dependent: :destroy
    has_many :stocks, dependent: :destroy
    has_many :sales, dependent: :destroy
    
    before_save :upt_fields
    before_update :upt_fields

	validates_presence_of       :name, message: I18n.t('models.inventory.item.messages.presence_name')
	validates_presence_of       :category_id, message: I18n.t('models.inventory.item.messages.presence_category')
    validates_uniqueness_of     :name, message: I18n.t('models.inventory.item.messages.unique_name')
    validates_numericality_of   :costprice, :saleprice, message: I18n.t('models.inventory.item.messages.alone_numbers')
    validates_numericality_of   :costprice , :greater_than_or_equal_to => 100, message: I18n.t('models.inventory.item.messages.greater_costprice')
    validates_numericality_of   :saleprice , :greater_than_or_equal_to => 100, message: I18n.t('models.inventory.item.messages.greater_saleprice')
 
private
  def upt_fields
      self.name = self.name.capitalize
  end
end
