class AddressesController < ApplicationController

  def create
    a = Address.new(address_params)
    a.save!
    redirect_to :back
  end

  def update
    a = Address.find(params[:id])
    a.update_attributes(address_params)
    a.save!
    redirect_to :back
  end

  def address_params
    params.require(:address).permit(:address, :port, :failover_id)
  end
end
