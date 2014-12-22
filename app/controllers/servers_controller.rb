class ServersController < ApplicationController

  def update
    unless params[:save].nil?
      f = Server.find(params[:id])
      f.update_attributes(server_params)
      f.save!
    end

    unless params[:start].nil?
      f = Server.find(params[:id])
      f.start
    end

    unless params[:stop].nil?
      f = Server.find(params[:id])
      f.stop
    end




    redirect_to :back
  end


  def server_params
    params.require(:server).permit(:name)
  end
end
