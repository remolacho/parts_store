class Category < ActiveRecord::Base
	include Audit
	has_many :items
end
