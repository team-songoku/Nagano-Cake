class Customer::CartItemsController < ApplicationController

  def index
    @cart_items = CartItem.all
    #inject(0) で初期値をゼロにする⇨その０をsumとして定義する
    #cart_itemsのなっかに入っている１つのデータをitemに入れる(eachみたいな感じ)
    @total =  @cart_items.inject(0) { |sum, item| sum + item.subtotal }
    @order = Order.new
  end

  def create
    @cart_items = CartItem.new(cart_item_params)
    @cart_items.customer_id = current_customer.id
    if @cart_items.save
    redirect_to cart_items_path
    else
    # @item = Item.find(params[:id])
    render "show"
    end
  end

  def update
    @cart_items = CartItem.find(params[:id])
    @cart_items.update(cart_item_params)
    redirect_to request.referer
  end

  def destroy
    @cart_items = CartItem.find(params[:id])
    @cart_items.save
    redirect_to request.referer
  end


  def destroy_all

    @cart_items.destroy_all
    redirect_to request.referer
  end

  private

  def cart_item_params
      params.require(:cart_item).permit(:item_id,:quantity)
  end
end
