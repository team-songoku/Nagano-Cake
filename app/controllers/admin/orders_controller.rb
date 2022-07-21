class Admin::OrdersController < ApplicationController
  def show
    @order = Oder.find(params[:id])
  end

  def index
    @orders = Order.all
  end
  
  def index
  end
end
