class Chats::EventsController < ApplicationController
  before_action :set_event, only: [:show, :update]
  def show
    @event = Event.find(params[:id])
    @message = Message.new
    update
  end

  def update
    @event.messages.where.not(read: true).each do |message|
      message.read = true unless message.user == current_user
      message.save!
    end
  end

  private

  def set_event
    @event = Event.find(params[:id])
  end
end
