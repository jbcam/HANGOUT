class PagesController < ApplicationController

  def home
    @users = User.all
    @user = current_user
  end

  def chat
  end
end
