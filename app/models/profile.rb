class Profile < ActiveRecord::Base

  validates_uniqueness_of :route_id, :inbound_email  

  before_update :generate_mandrill_route, :if => :inbound_email_changed?
 
  belongs_to :location

  def generate_mandrill_route
    mandrill =  Mandrill::API.new MANDRILL_API_KEY
    domain   =  DOMAIN
    url      =  ENDPOINT
    if self.route_id.nil?
      route = mandrill.inbound.add_route domain, self.inbound_email, url
      self.route_id = route['id']
      self.save
    else
      route = mandrill.inbound.delete_route self.route_id
      route = mandrill.inbound.add_route domain, self.inbound_email, url
      self.route_id = route['id']
      self.save
    end
  end
  
   handle_asynchronously :generate_mandrill_route

end

