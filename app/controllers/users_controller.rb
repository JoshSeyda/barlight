class UsersController < ApplicationController
    def index
        @users = User.all
      end
    
      def show
      end
    
      def new
        @user = User.new
      end
    
      def edit
      end
    
      def create
        @user = User.new(user_params)
        @user.save
      end
    
      def update
        @user.update(user_params)
      end
    
      def destroy
        @user.destroy
      end
    
      private
        def set_user
          @user = User.find(params[:id])
        end
    
        def user_params
          params.require(:user).permit(:first, :last, :handle, :email, :password, :type)
        end
end
