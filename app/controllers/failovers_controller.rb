class FailoversController < ApplicationController

  def update
    unless params[:save].nil?
      f = Failover.find(params[:id])
      f.update_attributes(failover_params)
      f.save!
    end

    unless params[:start].nil?
      f = Failover.find(params[:id])
      response = f.start
      flash[:error] = response unless response==true
    end

    unless params[:stop].nil?
      f = Failover.find(params[:id])
      response = f.stop
      flash[:error] = response unless response==true
    end




    redirect_to :back
  end


  def failover_params
    params.require(:failover).permit(:state, :master_server_id, :backup_server_id, :name)
  end
end
