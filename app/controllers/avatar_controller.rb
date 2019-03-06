class AvatarController < ApplicationController
    class AvatarsController < ApplicationController
        def create
          @user = User.find(params[:user_id])
          @user.avatar.attach(params[:avatar])
          redirect_to(user_path(@user))
        end
      end
end
