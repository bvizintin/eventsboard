class EventsController < ApplicationController

  before_action :authenticate_user!, except: [:index, :show]
  before_action :authorize_owner!, only: [:edit, :update, :destroy]

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    @event.organizer = current_user

    if @event.save
      flash[:notice] = "Event je kreiran!"
      redirect_to @event
    else
      flash.now[:alert] = "Event nije kreiran!"
      render "new"
    end
  end

  def show
    @event = Event.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      flash[:alert] = "This page does not exist."
      redirect_to events_path
  end

  def index
    @events = Event.order(created_at: :desc)
  end

  def edit
    @event = Event.find(params[:id])
    rescue ActiveRecord::RecordNotFound
    flash[:alert] = "This page does not exist."
    redirect_to events_path
  end

  def update
    @event = Event.find(params[:id])
    if @event.update(event_params)
      flash[:notice] = "Event je updejtan!"
      redirect_to @event
    else
      flash.now[:alert] = "Updejt nije uspio!"
      render "edit"
    end
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    flash[:alert] = "Event je uspješno obrisan."
    redirect_to events_path
  end

  private
    def event_params
      params.require(:event).permit(:title, :description, :start_date, :end_date, :venue, :location)
    end

    def authorize_owner!
      @event = Event.find(params[:id])
      authenticate_user!

      unless @event.organizer == current_user
        flash[:alert] = "You don't have permission to #{action_name} the #{@event.title.upcase}"
        redirect_to events_path
      end
    end

end
