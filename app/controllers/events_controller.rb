class EventsController < ApplicationController

  def index
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    @event.user = current_user
    if @event.save
      flash[:notice] = "Event created"
      redirect_to @event
    else
      flash[:warning] = "Oops! something when wrong, please try again"
      render 'new'
    end
  end

  def edit
  end

  def update
  end

  private

  def event_params
    params.require(:event).permit(:name, :description, :address, :category_id, :starts_at, :ends_at)
  end
end
