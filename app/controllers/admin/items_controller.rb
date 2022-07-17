class Admin::ItemsController < ApplicationController
  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to admin_item_path(@item)
    else
      @items = Item.all
    render 'index'
    end
  end

  def show
  end

  def index
    @items = Item.all
  end

  def edit
  end

  private

  def item_params
    params.require(:item).permit(:name, :introduction, :without_tax, :is_active)
  end
end
