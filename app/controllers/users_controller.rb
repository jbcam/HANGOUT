class UsersController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:save_coordinates]
  before_action :find_users, only: [:index, :toggle_availability]

  def index
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

  def toggle_availability
    current_user.available? ? current_user.unavailable! : current_user.available!
    respond_to do |format|
      format.js
    end
  end

  def save_coordinates
    latitude = params[:lat]
    longitude = params[:lng]
    current_user.update!(latitude: latitude, longitude: longitude)

    respond_to do |format|
      format.html { redirect_to root_path }
      format.js
    end
  end

private

  def user_params
    params.require(:user).permit(:email, :first_name, :last_name, :linkedin, :avatar, :bio, :city, :job, :category_id, :mood, :status)
  end

  def find_users
    @users = User.where.not(id: current_user.id).where(status: 'available')
  end
end
