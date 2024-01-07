class EventQuotesController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  before_action :set_event, only: [:show, :edit, :update, :destroy, :new, :create]
  rescue_from ActiveRecord::RecordNotFound, with: :handle_record_not_found

  def index
    @events = user_signed_in? ? current_user.events : []
    @event_quote = user_signed_in? ? EventQuote.where(event_id: current_user.events.pluck(:id)) : []
  end

  def new
    @event = Event.find(params[:event_id])
    @event_form = EventForm.new
  end

  def create
    @event = Event.find(params[:event_id])
    @event_form = EventForm.new(event_quote_params)
    @event_form.event_id = @event.id 

    # 現在の日付をinput_dateに設定
    @event_form.input_date = Date.today
    
    # costがnullの場合、デフォルト値を設定
    @event_form.cost ||= 0

    # 既存のイベントバージョンの数をカウントし、1を加えてversion_numberに設定
    @event_form.version_number = EventQuote.where(event_id: @event.id).count + 1

    if @event_form.valid?
      @event_form.save
      redirect_to root_path
    else
      puts @event_form.errors.full_messages
      render :new
    end
  end

  private

  def event_quote_params
    params.require(:event_form).permit(
      :detail, :cost, :adult_count, :input_date, :child_count, 
      ceremonies_attributes: [:ceremony_type, :ceremony_cost],
      foods_attributes: [:food_type, :food_cost],
      venues_attributes: [:venue_type, :venue_cost],
      costumes_attributes: [:costume_type, :costume_cost],
      beauties_attributes: [:beauty_type, :beauty_cost],
      flowers_attributes: [:flower_type, :flower_cost],
      prints_attributes: [:print_type, :print_cost],
      stagings_attributes: [:staging_type, :staging_cost],
      photos_attributes: [:photo_type, :photo_cost],
      videos_attributes: [:video_type, :video_cost],
      gifts_attributes: [:gift_type, :gift_cost],
      pre_ceremonies_attributes: [:pre_ceremony_type, :pre_ceremony_cost]
    ).merge(event_id: params[:event_id])
  end

  def set_event
    @event = current_user.events.find(params[:id])
    redirect_to root_path unless @event
  end

  def handle_record_not_found
    flash[:alert] = "The event you were looking for could not be found."
    redirect_to root_path
  end
end
