class EventsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  before_action :set_event, only: [:edit, :update, :destroy]

  def index
    @events = user_signed_in? ? current_user.events : []
  end

  def new
    @event = Event.new
  end

  def create
    @event = current_user.events.build(event_params)
    if @event.save
      redirect_to new_event_event_quote_path(event_id: @event.id)
    else
      render :new
    end
  end

  def edit
    redirect_to root_path unless @event.user_id == current_user.id
  end

  def update
    if @event.update(event_params)
      redirect_to root_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def show
    @event = Event.find(params[:id])
    @event_quotes = @event.event_quotes || {}
  end

  def destroy
    @event = Event.find(params[:id])
    if @event.user_id == current_user.id
      @event.destroy
      redirect_to events_path
    else
      redirect_to events_path
    end
  end

  private

  def set_event
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:name, :event_date)
  end
end
