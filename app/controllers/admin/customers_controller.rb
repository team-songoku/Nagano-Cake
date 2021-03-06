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
    if @customer.update(customer_params)
      redirect_to admin_customer_path(@customer)
    else
      render "edit"
    end
  end



  private

  def customer_params
      params.require(:customer).permit(:email, :encrypted_password, :last_name, :first_name, :last_name_kana, :first_name_kana, :post_code, :address, :phone_number, :is_deleted)
  end


  def before_customer
     @customer = Customer.find(params[:id])
  end
end
