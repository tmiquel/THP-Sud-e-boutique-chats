class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  # GET /items
  # GET /items.json
  def index
    @cat_picture = CatPicture.all
    @tag = Tag.all

  end

  # GET /items/1
  # GET /items/1.json
  def show
  end

  # GET /items/new
 
end
