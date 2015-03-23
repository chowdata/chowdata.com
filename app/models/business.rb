class Business < ActiveRecord::Base
  belongs_to :user
  has_many  :locations
  has_many  :profiles, through: :locations
end
