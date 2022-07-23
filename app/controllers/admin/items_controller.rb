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
      render 'new'
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def index
    @items = Item.all
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to admin_item_path(@item)
    else
      @items = Item.all
      render 'index'
    end
  end

  def destroy
     @item = Item.find(params[:id])
     @item.destroy
     redirect_to admin_items_path
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :introduction, :without_tax, :is_active, :genre_id )
  end
end
