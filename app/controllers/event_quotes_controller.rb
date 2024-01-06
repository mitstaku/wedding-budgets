class EventQuotesController < ApplicationController
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
    params.require(:event_form).permit(:detail, :cost, :adult_count, :input_date, :child_count, :ceremony_type, :ceremony_cost, :food_type, :food_cost, :venue_type, :venue_cost, :costume_type, :costume_cost, :beauty_type, :beauty_cost, :flower_type, :flower_cost, :print_type, :print_cost, :staging_type, :staging_cost, :photo_type, :photo_cost, :video_type, :video_cost, :gift_type, :gift_cost, :pre_ceremony_type, :pre_ceremony_cost).merge(event_id: params[:event_id])
  end
end
