class Invoice < ActiveRecord::Base
  validates :vendor_name, presence: true
end
