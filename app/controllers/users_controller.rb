class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "\"#{current_user.name}\",thank you for signing up!"
      redirect_to root_url
    else
      flash[:error] = "Sorry something isnt right?!"
      render :new
    end
  end

  private
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation, :website)
    end
end
