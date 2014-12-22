class Failover < ActiveRecord::Base
  belongs_to :master_server, :class_name => "Server", :foreign_key => "master_server_id"
  belongs_to :backup_server, :class_name => "Server", :foreign_key => "backup_server_id"

  def startable?
    !backup_server_id.nil? && state == 0
  end

  def stoppable?
    state == 1
  end

  def available_servers(as = :backup)
    if as == :backup
      Server.where('id != ?', (self.master_server_id.nil? ? -1 : self.master_server_id))
    else
      Server.where('id != ?', (self.backup_server_id.nil? ? -1 : self.backup_server_id))
    end
  end

  def start()
    response = ApiOnlineFailover.edit({source: self.ip, destination: self.backup_server.ip})
    if response[:status] == 200
      self.state = 1
      self.save!
      true
    else
      response[:json]["error"]
    end

  end

  def stop()
    response = ApiOnlineFailover.edit({source: self.ip, destination: self.master_server.ip})
    if response[:status] == 200
      self.state = 0
      self.save!
      true
    else
      response[:json]["error"]
    end
  end



  #Class methods
  def self.snapshot
    failovers = ApiOnlineFailover.all
    failovers.each do |f|

      Failover.where(ip: f["source"]).first_or_create(
        ip: f["source"],
        master_server_id: Server.find_by_ip(f["destination"]).id,
        status: 0
      )

    end
  end


end
