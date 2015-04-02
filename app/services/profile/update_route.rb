class Profile::UpdateRoute

  def update_with_route(profile, profile_hash)
   profile.update(profile_hash)
    mandrill =  Mandrill::API.new MANDRILL_API_KEY
    route    =  profile.route || profile.create_route
    if route.mandrill_id == nil
      mandrill_return = Route::Add.new.add_route(profile_hash[:inbound_email], route)
    else
      mandrill_return = Route::Update.new.update_route(route, profile_hash[:inbound_email])
    end
    profile
  end


end
