class Dailysale < ActiveRecord::Base
	include Audit
	has_many :sales, dependent: :destroy
	has_many :dailyclosures, dependent: :destroy

    scope :less_date, ->(date) {
    	where("cdate_on < ?", date)
    }

end
