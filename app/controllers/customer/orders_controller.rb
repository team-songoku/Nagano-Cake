class Customer::OrdersController < ApplicationController
  # 注文情報入力画面（支払い方法・届け先）
  def new
    @order = Order.new
  end

  def confirm
    @cart_items = CartItem.all
    @total =  @cart_items.inject(0) { |sum, item| sum + item.subtotal }
    @order = current_customer.orders.new(order_params)
    # 配送先のradio_button選択分岐。
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
      # カートの中身の情報も一緒にsaveする。
      current_customer.cart_items.each do |cart_item|
        @order_detail = OrderDetail.new
        @order_detail.item_id = cart_item.item_id
        @order_detail.quantity = cart_item.quantity
        @order_detail.price = cart_item.item.with_tax_price
        @order_detail.order_id = @order.id
        @order_detail.save
      end
      current_customer.cart_items.destroy_all
      redirect_to orders_complete_path
    else
      render :new
    end
  end

  def complete
  end

  def index
    @orders = current_customer.orders
  end

  def show
    @order = Order.find(params[:id])
  end

  private

  def order_params
    params.require(:order).permit(:shipping_postal_code, :shipping_address, :shipping_name, :payment_method, :postage, :total_amount)
  end
end
