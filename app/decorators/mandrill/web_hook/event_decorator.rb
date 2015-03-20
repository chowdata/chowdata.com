class Mandrill::WebHook::EventDecorator

  def handle_inbound(event_payload)
    puts "INBOUND HANDLED"
    exit
  end
end
