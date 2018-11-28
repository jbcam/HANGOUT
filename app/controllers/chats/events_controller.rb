class Chats::EventsController < ApplicationController
  def show
    @event = Event.find(params[:id])
    @message = Message.new
  end
end
