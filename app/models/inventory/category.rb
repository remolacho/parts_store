class  Inventory::Category < ActiveRecord::Base
	include Audit
	has_many :items , dependent: :destroy
end
