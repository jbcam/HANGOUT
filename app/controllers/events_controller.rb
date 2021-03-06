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
    @attendees = @event.attendees
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
        send_create_message(@event)
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

  def send_create_message(event)
    message = Message.new
    message.user = current_user
    message.messageable = event
    message.content = "#{current_user.first_name} has created the event"
    message.system_message = true
    message.save
  end

  def event_params
    parameters = params.require(:event).permit(:name, :description, :address,:link, :category_id, :starts_at, :ends_at)
    dates = parameters[:starts_at].split(" to ")
    if dates.first.present?
    parameters[:starts_at] = Time.parse(dates.first).to_datetime
    else
      parameters[:starts_at] = Time.now
    end
    if dates.last.present?
      parameters[:ends_at] = Time.parse(dates.last).to_datetime
    else
      parameters[:starts_at] = Time.now
    end
    parameters
  end
end
