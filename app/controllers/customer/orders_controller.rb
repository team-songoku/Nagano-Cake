class Customer::OrdersController < ApplicationController
  # 注文情報入力画面（支払い方法・届け先）
  def new
    @order = Order.new
  end

  def create
  end

  def index
  end

  def show
  end

  def confirm
    @cart_items = CartItem.all
    @total =  @cart_items.inject(0) { |sum, item| sum + item.subtotal }
    @order = current_customer.order.new(order_params)
  end

  def complete
  end

  private

  def order_params
    params.require(:order).permit(:payment_method)
  end
end
