class Route::Update

  def update_route(route, inbound_email)
    mandrill =  Mandrill::API.new MANDRILL_API_KEY

    begin
      mandrill_return = mandrill.inbound.update_route route.mandrill_id, inbound_email, ENDPOINT
    rescue Exception => e
      Rails.logger.error "[error] Route::Update error #{e}"  
      return false
    end

    mandrill_return
  end

  handle_asynchronously :update_route

end
