class UsersController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:save_coordinates]
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

  def save_coordinates
    latitude = params[:user][:latitude]
    longitude = params[:user][:longitude]
    current_user.update(latitude: latitude, longitude: longitude)

     respond_to do |format|
        format.html { redirect_to root_path }
        format.js  # <-- will render `app/views/reviews/create.js.erb`
      end
  end

private

  def user_params
    params.require(:user).permit(:email, :first_name, :last_name, :linkedin, :avatar, :bio, :city, :job, :category_id, :mood)
  end
end
