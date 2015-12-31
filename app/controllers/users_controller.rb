class UsersController < ApplicationController

  def index
    @users=User.all
  end

  def new
    @user=User.new
  end

  def create
    @user=User.new(user_params)
    if @user.save
      UserMailer.signup_confirmation(@user).deliver
      redirect_to users_path
    else
      render "new"
    end
  end

  protected
  def user_params
    params.require(:user).permit(:name,:email)
  end

end
