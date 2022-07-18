class Customer::CartItemsController < ApplicationController

  def index
    @cart_items = CartItem.all
    #inject(0) で初期値をゼロにする⇨その０をsumとして定義する
    #cart_itemsのなっかに入っている１つのデータをitemに入れる(eachみたいな感じ)
    @total =  @cart_items.inject(0) { |sum, item| sum + item.subtotal }
  end

  def create
      @cart_item = CartItem.new(cart_item_params)
      @cart_item.customer_id = current_customer.id
      if @cart_item.save
        redirect_to cart_items_path
      else
      @item = Item.find(params[:id])
      render "show"
      end
  end


  private

  def cart_item_params
      params.require(:cart_item).permit(:item_id,:quantity)
  end
end
