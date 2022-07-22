class Admin::OrdersController < ApplicationController
  def show
    @order = Order.find(params[:id])
  end

  def update
    @order = Order.find(params[:id])
    if @order.update(order_params)
      redirect_to admin_order_path(@order.id)
    else
      @orders = Order.all
      render 'index'
    end
  end

  def index
    @orders = Order.all
  end

  private

  def order_params
    params.require(:order).permit(:status)
  end
end
