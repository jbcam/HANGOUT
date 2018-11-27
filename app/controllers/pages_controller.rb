class PagesController < ApplicationController

  def home
    if params[:query].present? && params[:user_index]
      @users = User.search_users_by_category_id(params[:query])
    elsif params[:query].present? && params[:event_index]
      @events = Event.search_events_by_category_id(params[:query])
    elsif params[:event_index]
      @events = Event.all
    else
      @users = User.all
    end
  end

  def chat
  end
end
