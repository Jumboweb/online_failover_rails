class Utils
  def self.extract_id(path)
    path[/\/(\d+)/,1].to_i
  end
end
