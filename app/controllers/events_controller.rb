class EventsController < ApplicationController

  def show
    @event = Event.find(params[:id])
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end
end
