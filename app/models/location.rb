class Location < ActiveRecord::Base
 
  belongs_to :business
  has_one :profile

end
