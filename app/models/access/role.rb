class Role < ActiveRecord::Base
  include Audit
  has_many :users, dependent: :destroy
end
