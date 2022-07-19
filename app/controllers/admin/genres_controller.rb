class Admin::GenresController < ApplicationController

  def index
    @genre = Genre.new
  end

  def create
    @genre = Genre.new(genre_params)
    if @genre.save
      redirect_to request.referer
    else
      
      render 'index'
    end
  end

  def edit
    
  end

  def update
  end


  private

  def genre_params
    params.require(:genre).permit(:name)
  end
end
