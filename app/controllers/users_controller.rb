class UsersController < ApplicationController
  before_action :set_user, only: %i[show edit update destroy access_my_profile_only]
  before_action :authenticate_user!, only: %i[show edit update destroy index]
  before_action :access_my_profile_only, only: %i[show edit update destroy index]

  def new
    @user = User.new
  end

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def edit; end

  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    email = @user.email
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: "User '#{email}' was successfully destroyed." }
      format.json { head :no_content }
    end
  end

end
