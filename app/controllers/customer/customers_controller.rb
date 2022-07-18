class Customer::CustomersController < ApplicationController
  
  def show
    @customer = current_customer
  end

  def edit
    @customer = Customer.find(params[:id])
  end
  
end
