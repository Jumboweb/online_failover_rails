class ApiOnline
  def self.connection
    conn = Faraday.new(:url => "https://api.online.net/api") do |faraday|
      faraday.request  :url_encoded             # form-encode POST params
      faraday.response :logger                  # log requests to STDOUT
      faraday.adapter  Faraday.default_adapter  # make requests with Net::HTTP
    end
    conn
  end

  def self.get_request(resource,options = {})

    conn = self.connection
    response = conn.get do |req|
      req.url relative_path_for(resource)
      req.headers['Authorization'] = "Bearer #{ONLINE_TOKEN}"
      options.each_with_object({}) do |(key, value)|
        req.params["#{key}"] = value
      end
    end
    {json: JSON.parse(response.body), status: response.status}
  end

  def self.post_request(resource,options = {})

    conn = self.connection
    response = conn.post do |req|
      req.url relative_path_for(resource)
      req.headers['Authorization'] = "Bearer #{ONLINE_TOKEN}"
      req.body = options
    end
    {
      json: (response.status == 200 ? response.body : JSON.parse(response.body)),
      status: response.status
    }
  end

  def self.relative_path_for(resource)
    "v1/#{resource}"
  end



end
