class PagesController < ApplicationController

  def home
    if params[:query].present?
      @users = User.search_users_by_category_id(params[:query])
    else
      @users = User.all
    end
    @user = current_user
  end

  def chat
  end
end
