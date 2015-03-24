class Route < ActiveRecord::Base
  
  belongs_to :profile


  def update_route(value)
    mandrill =  Mandrill::API.new MANDRILL_API_KEY
    route = mandrill.inbound.update_route self.mandrill_id, value, ENDPOINT
    self.mandrill_id = route['id']
    self.save!
  end

  def remove_route(id)
    mandrill =  Mandrill::API.new MANDRILL_API_KEY
    route = mandrill.inbound.delete_route self.mandrill_id
    self.mandrill_id = nil
    self.save!
  end

  def add_route(value)
    mandrill =  Mandrill::API.new MANDRILL_API_KEY
    route = mandrill.inbound.add_route DOMAIN, value, ENDPOINT
    self.mandrill_id = route['id']
    self.save!
  end


end
