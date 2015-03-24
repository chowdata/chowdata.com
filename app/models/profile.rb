class Profile < ActiveRecord::Base
  
  before_update :generate_mandrill_route, :if => :inbound_email_changed?
 
  belongs_to :location

  def generate_mandrill_route
    mandrill =  Mandrill::API.new MANDRILL_API_KEY
    domain   =  DOMAIN
    url      =  ENDPOINT
 #   mandrill.inbound.remove route domain, self.inbound_email_was, url
    mandrill.inbound.add_route domain, self.inbound_email, url
  end

end

