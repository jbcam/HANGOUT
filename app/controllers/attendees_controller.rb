class AttendeesController < ApplicationController
  before_action :set_event, only: [:create, :destroy]

  def create
    attendee = Attendee.new
    attendee.event = @event
    attendee.user = current_user
    send_join_message(@event) if attendee.save
    respond_to do |format|
      format.html { redirect_to event_path(@event) }
      format.js
    end
  end

  def destroy
    attendee = Attendee.find(params[:id])
    send_left_message(@event) if attendee.destroy
    respond_to do |format|
      format.html { redirect_to event_path(@event) }
      format.js
    end
  end

  private

  def set_event
    @event = Event.find(params[:event_id])
  end

  def send_join_message(event)
    message = Message.new
    message.user = current_user
    message.messageable = event
    message.content = "#{current_user.first_name} has join the event"
    message.system_message = true
    message.save
    BroadcastMessageJob.perform_now(message)
  end

  def send_left_message(event)
    message = Message.new
    message.user = current_user
    message.messageable = event
    message.content = "#{current_user.first_name} has left the event"
    message.system_message = true
    message.save
    BroadcastMessageJob.perform_now(message)
  end
end
