class Route::Add

  def add_route(inbound_email, route)
    mandrill =  Mandrill::API.new MANDRILL_API_KEY

    begin
      mandrill_return =  mandrill.inbound.add_route DOMAIN, inbound_email, ENDPOINT
      route.mandrill_id = mandrill_return['id']
      route.save!
    rescue Exception => e
      Rails.logger.error "[error] Route::Update error #{e}"
      return false
    end

    mandrill_return
  end

  handle_asynchronously :add_route

end
