class EventsController < ApplicationController

  def index
    if params[:query].present?
      @events = Event.search_events_by_category_id(params[:query])
    else
      @events = Event.all
    end
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
      # event owner is automatically attending his event
      attendee = Attendee.new
      attendee.event = @event
      attendee.user = current_user
      if attendee.save
        flash[:notice] = "Event created"
        redirect_to @event and return
      end
    end
    flash[:alert] = "Oops! something when wrong, please try again"
    render 'new'
  end

  def edit
  end

  def update
  end

  private

  def event_params
    params.require(:event).permit(:name, :description, :address,:link, :category_id, :starts_at, :ends_at)
  end
end
