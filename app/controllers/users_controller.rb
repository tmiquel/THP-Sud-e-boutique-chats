class UsersController < ApplicationController
 
  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    post_params = params[:user]
    if @user.update(first_name: post_params[:first_name], last_name: post_params[:last_name], email: post_params[:email])
      # on rajoute éventuellement autres params comme adresse, etc 
      redirect_to user_path(params[:id])
  	else
  	  flash[:danger] = "Un message de danger ici"
  	  render :new 
  	end
  end
  
    def destroy
    end

    def user_params
      params.require(:user).permit(:first_name, :last_name, :email)
    end

end
