class Admin::CustomersController < ApplicationController
  before_action :before_customer, only:[:show,:edit,:update]

  def index
    @customers = Customer.all
  end

  def show
  end

  def edit
  end

  def update
    
  end


  private

  # def customer_params
  #   params.require(:customer).permit()
  # end

  def before_customer
     @customer = Customer.find(params[:id])
  end
end
