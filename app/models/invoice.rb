class Invoice < ActiveRecord::Base

  belongs_to :location
  validates :vendor_name, presence: true


end
