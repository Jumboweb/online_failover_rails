class Server < ActiveRecord::Base

  def startable?
    my_failovers.any?
  end

  def my_failovers
    Failover.where(master_server_id: id, state: 0).where('backup_server_id is not null')
  end

  def start()
    my_failovers.each do |f|
      f.start
    end
  end

  def stop()
    my_failovers.each do |f|
      f.stop
    end
  end

  #Class methods
  def self.snapshot
    servers = ApiOnlineServer.all
    servers.each do |s|
      tmp_id = Utils.extract_id(s)
      server_data = ApiOnlineServer.find_by_id(tmp_id)
      Server.where(online_id: tmp_id).first_or_create(
        online_id: tmp_id,
        ip: server_data["network"]["ip"].first,
        name:server_data["hostname"]
      )
    end
  end
end
