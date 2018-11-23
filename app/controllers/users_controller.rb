class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def edit
    @user = current_user
  end

  def show
    @user = User.find(params[:id])
  end

  def update

    @user = current_user
      if @user.update(user_params)
        flash[:notice] = 'Successfully updated'
        redirect_to root_path
      else
        render :edit
      end
  end

private

  def user_params
    params.require(:user).permit(:email, :first_name, :last_name, :linkedin, :avatar, :bio, :city, :job)
  end
end
