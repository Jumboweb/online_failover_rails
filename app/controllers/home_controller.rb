class HomeController < ApplicationController

  def index
    @servers = Server.all
    @failovers = Failover.all
    @failovers.each{|f| f.addresses.build}
  end

  def snapshot
    Server.snapshot
    Failover.snapshot
    redirect_to :back
  end
end
