class Chats::EventsController < ApplicationController
  before_action :set_event, only: [:show, :update]
  def show
    @event = Event.find(params[:id])
    @message = Message.new
  end

  def update
    @event.messages.where.not(read: true).each do |message|
      message.read = true unless message.user == current_user
      message.save!
    end

    # @unread_messages = current_user.unread_messages;

    respond_to do |format|
      format.html { redirect_to event_path(@event) }
      format.js
    end
  end

  private

  def set_event
    @event = Event.find(params[:id])
  end
end
