class Address < ActiveRecord::Base
  belongs_to :failover

  def has_failed?
    failed_ping > 0 rescue false
  end

  def test
    server_up = (`nmap #{address} -p #{port} | grep open | wc -l`.to_i > 0)
    website_up = true

    if(server_up && ([80, 443].include? self.port))
      website_up = (`curl -silent -IL #{address}:#{port} | grep 'Status: 200 OK' | wc -l`.to_i > 0)
    end

    if(website_up && server_up)
      self.failed_ping = 0
      save!
    else
      self.failed_ping = self.failed_ping + 1
      save!

      #to catch this event, subscribe a listener object :
      #EventBus.subscribe(ErrorRecorder.new)
      #in which you implement a service_failed method :
      # def service_failed(payload)
      #   address = payload[:address]
      #   //...
      # end
      #for further information please see https://github.com/kevinrutherford/event_bus
      #a template exists in the initalizers folder
      EventBus.announce(:service_failed, address: self)
    end

  end

end
