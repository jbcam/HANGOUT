class PagesController < ApplicationController

  def home
    @users = User.all
  end

  def chat
  end
end
