class Customer::ItemsController < ApplicationController
  def top
    @items = Item.all
  end

  def index
    @items = Item.all
  end


  def show
  end

  def about
  end
end
