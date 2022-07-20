class Customer::OrdersController < ApplicationController
  # 注文情報入力画面（支払い方法・届け先）
  def new
    @order = Order.new
  end

  def confirm
    @cart_items = CartItem.all
    @total =  @cart_items.inject(0) { |sum, item| sum + item.subtotal }
    @amount =  order.postage
    @order = current_customer.order.new(order_params)
    if params[:order][:address_select] == "1"
      @order.shipping_postal_code = current_customer.post_code
      @order.shipping_address = current_customer.address
      @order.shipping_name = current_customer.last_name+current_customer.first_name
    elsif params[:order][:address_select] == "2"
      @shipping_address = ShippingAddress.find(params[:order][:address_id])
      @order.shipping_postal_code = @shipping_address.postal_code
      @order.shipping_address = @shipping_address.address
      @order.shipping_name = @shipping_address.name
    else params[:order][:address_select] == "3"
    end
  end

  def create
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    if @order.save
      redirect_to items_path
    else
    end
  end

  def complete
  end

  def index
  end

  def show
  end

  private

  def order_params
    params.require(:order).permit(:payment_method, :shipping_postal_code, :shipping_address, :shipping_name)
  end
end
