class Profile::Update

  def update_with_route(profile, profile_hash)
   profile.update(profile_hash)
    mandrill =  Mandrill::API.new MANDRILL_API_KEY
    route    =  profile.route || profile.create_route
    if route.mandrill_id == nil
      mandrill_return = add_route(profile_hash[:inbound_email], route)
    else
      mandrill_return = update_route(route, profile_hash[:inbound_email])
    end
    profile
  end

  private
  

  def delete_route(route)
    mandrill =  Mandrill::API.new MANDRILL_API_KEY
    mandrill_return = mandrill.inbound.delete_route route.mandrill_id
    route.update(mandrill_id: nil)
    route.save!
  end

  def update_route(route, inbound_email)
    mandrill =  Mandrill::API.new MANDRILL_API_KEY
    mandrill_return = mandrill.inbound.update_route route.mandrill_id, inbound_email, ENDPOINT
    mandrill_return
  end

  def add_route(inbound_email, route)
    mandrill =  Mandrill::API.new MANDRILL_API_KEY
    mandrill_return =  mandrill.inbound.add_route DOMAIN, inbound_email, ENDPOINT
    route.mandrill_id = mandrill_return['id']
    route.save!
    mandrill_return
  end
  
  handle_asynchronously :add_route
  handle_asynchronously :update_route


end
