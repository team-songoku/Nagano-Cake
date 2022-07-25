class Admin::OrdersController < ApplicationController
  before_action :authenticate_admin!

  def show
    @order = Order.find(params[:id])
  end

  def update
    @order = Order.find(params[:id])
    if @order.update(order_params)
      # 注文ステータスが(入金確認済み)になったときif内の処理を実行。
      if @order.status == "payment_confirmation"
        # 制作ステータスを全て(制作待ち)に更新する。
        @order.order_details.each do |order_detail|
          order_detail.making_status = "waiting"
          order_detail.save
        end
      end
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
