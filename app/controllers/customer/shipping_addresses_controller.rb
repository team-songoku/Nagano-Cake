class Customer::ShippingAddressesController < ApplicationController
  
  protect_from_forgery
  before_action :authenticate_customer!
  

  def create
    shipping_address = current_customer.shipping_addresses.new(shipping_addresses_params)
    shipping_address.save
    redirect_to shipping_addresses_path
  end
  
  def index
    @shipping_address = ShippingAddress.new
    @shipping_addresses = current_customer.shipping_addresses
  end
  
  def edit
    @shipping_address = ShippingAddress.find(params[:id])
  end
  
  
  def update
    shipping_address = ShippingAddress.find(params[:id])
    shipping_address.update(shipping_addresses_params)
    redirect_to shipping_addresses_path
  end
  
  def destroy
    shipping_address = ShippingAddress.find(params[:id])
    shipping_address.destroy
    redirect_to shipping_addresses_path
  end

  private
  
  def shipping_addresses_params
    params.require(:shipping_address).permit(:postal_code, :address, :name)
  end
  
end
