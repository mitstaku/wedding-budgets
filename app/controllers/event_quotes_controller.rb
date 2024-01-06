class EventQuotesController < ApplicationController
  def new
    @event = Event.find(params[:event_id])
    @event_quote = EventQuote.new
  end

  def create
    @event = Event.find(params[:event_id])
    @event_quote = EventQuote.new(event_quote_params)
    @event_quote.event_id = @event.id 

    # 現在の日付をinput_dateに設定
    @event_quote.input_date = Date.today
    
    # costがnullの場合、デフォルト値を設定
    @event_quote.cost ||= 0

    # 既存のイベントバージョンの数をカウントし、1を加えてversion_numberに設定
    @event_quote.version_number = EventQuote.where(event_id: @event.id).count + 1

    if @event_quote.valid?
      @event_quote.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def event_quote_params
    params.require(:event_quote).permit(:version_number, :details, :cost, :input_date, :ceremony_id, :food_id, :venue_id, :costume_id, :paper_id, :beauty_id, :flower_id, :staging_id, :photo_id, :video_id, :gift_id, :pre_ceremony_id)
  end
end
