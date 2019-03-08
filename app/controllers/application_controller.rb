class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
	
	private
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :phone_number])
		devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :phone_number])
	end

	def set_user
    @user = User.friendly.find(params[:id])
  end

	def set_user_cart
		@user_id = User.friendly.find(params[:user_id])
	end

  # Never trust parameters from the scary internet, only allow the white list through.
  def user_params
    params.require(:user).permit(:email, :password, :description, :first_name, :last_name)
  end

  def access_my_profile_only
    unless @user == current_user
      redirect_to root_url, alert: 'Accessing or modifying another user data is not allowed.'
    end
  end

	def access_my_cart_only
    unless @user_id == current_user
      redirect_to root_url, alert: 'Accessing or modifying another user data is not allowed.'
    end
  end

end

