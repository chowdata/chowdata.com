class Profile < ActiveRecord::Base
  
  before_update :generate_mandrill_route, :if => :mandrill_route_changed?
 
  belongs_to :location

  def generate_mandrill_route
    mandrill =  Mandrill::API.new MANDRILL_API_KEY
    domain   =  CHOWDATA_DOMAIN
    url      =  ENDPONT
  #  pattern  =  self.email.split(
  end

end

