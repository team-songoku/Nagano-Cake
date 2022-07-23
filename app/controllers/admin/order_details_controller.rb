class Admin::OrderDetailsController < ApplicationController
  before_action :authenticate_admin!

  def update
    @order_detail = OrderDetail.find(params[:id])
    if @order_detail.update(order_detail_params)
      # making_statusがcooking(製作中)の時if内の処理を実行。
      if @order_detail.making_status == "cooking"
        @order_detail.order.status = "in_making"
        @order_detail.order.save
      end
      # order_detailsの(order_id)の数が制作完了(completed)の数と同じになる時にif内の処理を実行。
      if @order_detail.order.order_details.count == @order_detail.order.order_details.where(making_status:"completed").count
        @order_detail.order.status = "preparing_shipping"
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
