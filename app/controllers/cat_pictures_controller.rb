class CatPicturesController < ApplicationController
  def index
  	@cat_pictures = CatPicture.all.order("title ASC") 
  end

  def show
  	@id=params[:id]
  	@cat_picture=CatPicture.where('id=?',@id).first
  end
end
