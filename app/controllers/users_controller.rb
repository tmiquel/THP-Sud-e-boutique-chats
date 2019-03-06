class UsersController < ApplicationController
 
  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def destroy
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :phone_number)
  end

end
