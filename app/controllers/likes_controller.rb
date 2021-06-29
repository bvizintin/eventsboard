class LikesController < ApplicationController
  before_action :set_event
  before_action :authenticate_user!
  skip_after_action :verify_authorized

  def create
    @like = @event.likes.where(like: params[:like], user_id: current_user).create

    flash[:notice] = "You #{params[:like]} this event."
    redirect_to event_path(@event)
  end

  private
    def set_event
      @event = Event.friendly.find(params[:event_id])
    end

end
