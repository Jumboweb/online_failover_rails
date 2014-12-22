class HomeController < ApplicationController

  def index
    @servers = Server.all
    @failovers = Failover.all
  end

  def snapshot
    Server.snapshot
    Failover.snapshot
    redirect_to :back
  end
end
