class Customer::CartItemsController < ApplicationController
  before_action :authenticate_customer!

  def index
    @cart_item = CartItem.all
    #inject(0) で初期値をゼロにする⇨その０をsumとして定義する
    #cart_itemのなかに入っている１つのデータをitemに入れる(eachみたいな感じ)
    @total =  @cart_item.inject(0) { |sum, item| sum + item.subtotal }
  end

  def create
    @cart_item = CartItem.new(cart_item_params)
    @cart_item.customer_id = current_customer.id
    @cart_items = current_customer.cart_items.all
    @cart_items.each do |cart_item|
      if cart_item.item_id==@cart_item.item_id
        new_quantity = cart_item.quantity + @cart_item.quantity
        cart_item.update_attribute(:quantity, new_quantity)
        @cart_item.delete
      end
    end
    @cart_item.save
    redirect_to cart_items_path,notice: "カートに商品が入りました"
  end

  def update
    @cart_item = CartItem.find(params[:id])
    @cart_item.update(cart_item_params)
    redirect_to request.referer
  end

  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to request.referer
  end


  def destroy_all
    @cart_item = current_customer.cart_items
    @cart_item.destroy_all
    redirect_to request.referer
  end

  private

  def cart_item_params
      params.require(:cart_item).permit(:item_id,:quantity,:customer_id)
  end
end
