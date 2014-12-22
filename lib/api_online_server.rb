class ApiOnlineServer

  def self.all
    ApiOnline::get_request('server')[:json]
  end

  def self.find_by_id(server_id)
    ApiOnline::get_request("server/#{ server_id }")[:json]
  end


end
