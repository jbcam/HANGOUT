class AttendeesController < ApplicationController
  def create
    event = Event.find(Params[:id])
    attendee = Attendee.new
    attendee.event = event
    attendee.user = current_user

  end
end
