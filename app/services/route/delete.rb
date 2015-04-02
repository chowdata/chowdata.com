class Route::Delete

 def delete_route(route)
    mandrill =  Mandrill::API.new MANDRILL_API_KEY
    mandrill_return = mandrill.inbound.delete_route route.mandrill_id
    route.update(mandrill_id: nil)
    route.save!
  end

  handle_asynchronously :delete_route

end

