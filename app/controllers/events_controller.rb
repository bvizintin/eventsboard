class EventsController < ApplicationController
  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
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
  end

  def index
    @events = Event.all
  end

  def edit
    @event = Event.find(params[:id])
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


  private
    def event_params
      params.require(:event).permit(:title, :description, :start_date, :end_date, :venue, :location)
    end

end
