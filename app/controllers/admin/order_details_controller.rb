class Admin::OrderDetailsController < ApplicationController
  before_action :authenticate_admin!

  def update
    @order_detail = OrderDetail.find(params[:id])
    if @order_detail.update(order_detail_params)
      if @order_detail.making_status == "cooking"
        @order_detail.order.status = "in_making"
        @order_detail.order.save
      end
      redirect_to admin_order_path(@order_detail.order.id)
    else
      render 'index'
    end
  end

private

  def order_detail_params
    params.require(:order_detail).permit(:making_status)
  end
end
