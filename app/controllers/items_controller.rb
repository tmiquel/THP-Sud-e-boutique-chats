class ItemsController < ApplicationController


  def index
  
    @cat_picture=CatPicture.all
    @tag=Tag.all

  end


  def show
  end

 end