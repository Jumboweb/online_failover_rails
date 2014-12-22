class ApiOnlineFailover

  def self.all
    ApiOnline::get_request('server/failover')[:json]
  end

  def self.find_by_id(ip)
    ApiOnline::get_request("server/failover/#{ ip }")[:json]
  end

  def self.edit(options={})
    ApiOnline::post_request("server/failover/edit", options)
  end


end
