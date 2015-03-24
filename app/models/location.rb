class Location < ActiveRecord::Base
  
  before_create :build_default_profile
 
  belongs_to :business

  has_one :profile
  accepts_nested_attributes_for :profile

  has_many :invoices


  private

    def build_default_profile
      self.build_profile
    end


end
