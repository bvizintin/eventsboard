class EventsController < ApplicationController


  before_action :authenticate_user!, except: [:index, :show]
  #before_action :authorize_owner!, only: [:edit, :update, :destroy]

  def new
    @event = Event.new
    authorize @event, :new?
  end

  def create
    @event = Event.new(event_params)
    authorize @event, :create?

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
    @categories = Category.order(:name)
    @event = Event.friendly.find(params[:id])
    @comment = Comment.new
    @comment.event_id = @event.id
    authorize @event, :show?
    rescue ActiveRecord::RecordNotFound
      flash[:alert] = "This page does not exist."
      redirect_to events_path
  end

  def index
    if params[:query].present?
      @events = Event.search(params[:query])
    else
      @events = Event.order(created_at: :desc).paginate(page: params[:page], per_page: 5)
    end
    @categories = Category.order(:name)
    authorize @events, :index?                        #ovo je autorizacija iz Pundit Gema. koristimo je umjesto authorize_owner
  end

  def edit
      @event = Event.friendly.find(params[:id])
    authorize @event, :update?
    rescue ActiveRecord::RecordNotFound
    flash[:alert] = "This page does not exist."
    redirect_to events_path
  end

  def update
      @event = Event.friendly.find(params[:id])
    authorize @event, :update?
    if @event.update(event_params)
      flash[:notice] = "Event je updejtan!"
      redirect_to @event
    else
      flash.now[:alert] = "Updejt nije uspio!"
      render "edit"
    end
  end

  def destroy
    @event = Event.friendly.find(params[:id])
    authorize @event, :destroy?
    @event.destroy
    flash[:alert] = "Event je uspješno obrisan."
    redirect_to events_path
  end

  private
    def event_params
      params.require(:event).permit(:title, :description, :start_date, :end_date, :venue, :location, :image, :category_id, :seats)
    end

    # def authorize_owner!
    #   @event = Event.find(params[:id])
    #   authenticate_user!
    #
    #   unless @event.organizer == current_user
    #     flash[:alert] = "You don't have permission to #{action_name} the #{@event.title.upcase}"
    #     redirect_to events_path
    #   end
    # end

end
