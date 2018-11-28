class My::EventsController < ApplicationController
  def index
    @user = current_user
    @next_events = current_user.events.where("starts_at >= ?", Date.today)
    @past_events = current_user.events.where("ends_at < ?", Date.today)
  end
end
