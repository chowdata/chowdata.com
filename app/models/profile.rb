class Profile < ActiveRecord::Base

   validates_uniqueness_of :inbound_email, allow_nil: true
   validates :inbound_email, length: { minimum: 1 },  format: { with: /\A[a-zA-Z0-9]+\Z/ }, on: :update
 # before_create :build_default_route
 
  belongs_to :location
  has_one    :route

  private

 #   def build_default_route
 #     self.build_route
 #   end

end

