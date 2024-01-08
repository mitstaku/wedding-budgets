class EventQuotesController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  rescue_from ActiveRecord::RecordNotFound, with: :handle_record_not_found

  def index
    @events = user_signed_in? ? current_user.events : []
    @event_quotes = user_signed_in? ? EventQuote.where(event_id: current_user.events.pluck(:id)).group_by(&:event_id) : []
  end

  def new
    @event = Event.find(params[:event_id])
    @event_form = EventForm.new
    @fieldIndices = {
      foods: 1,
      venues: 1,
      ceremonies: 1,
      costumes: 1,
      beauties: 1,
      flowers: 1,
      prints: 1,
      stagings: 1,
      photos: 1,
      videos: 1,
      gifts: 1,
      pre_ceremonies: 1
    }
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
      redirect_to event_path(@event)
    else
      @fieldIndices = {
        foods: 1,
        venues: 1,
        ceremonies: 1,
        costumes: 1,
        beauties: 1,
        flowers: 1,
        prints: 1,
        stagings: 1,
        photos: 1,
        videos: 1,
        gifts: 1,
        pre_ceremonies: 1
      }
      render :new
    end
  end

  def destroy
    @event = Event.find(params[:event_id])
    @event_quote = @event.event_quotes.find(params[:id])
    if @event.user_id == current_user.id
      @event_quote.destroy
      redirect_to event_path(@event)
    else
      redirect_to event_path(@event)
    end
  end

  def new_food
    @event_form = EventForm.new
    @event_form.foods.build
    render partial: 'food', locals: { index: Time.now.to_i, f: @event_form }
  end

  def new_costume
    @event_form = EventForm.new
    @event_form.costumes.build
    render partial: 'costume', locals: { index: Time.now.to_i, f: @event_form }
  end

  def new_venue
    @event_form = EventForm.new
    @event_form.venues.build
    render partial: 'venue', locals: { index: Time.now.to_i, f: @event_form }
  end

  def new_ceremony
    @event_form = EventForm.new
    @event_form.ceremonies.build
    render partial: 'ceremony', locals: { index: Time.now.to_i, f: @event_form }
  end

  def new_beauty
    @event_form = EventForm.new
    @event_form.beauties.build
    render partial: 'beauty', locals: { index: Time.now.to_i, f: @event_form }
  end

  def new_flower
    @event_form = EventForm.new
    @event_form.flowers.build
    render partial: 'flower', locals: { index: Time.now.to_i, f: @event_form }
  end

  def new_print
    @event_form = EventForm.new
    @event_form.prints.build
    render partial: 'print', locals: { index: Time.now.to_i, f: @event_form }
  end

  def new_staging
    @event_form = EventForm.new
    @event_form.stagings.build
    render partial: 'staging', locals: { index: Time.now.to_i, f: @event_form }
  end

  def new_photo
    @event_form = EventForm.new
    @event_form.photos.build
    render partial: 'photo', locals: { index: Time.now.to_i, f: @event_form }
  end

  def new_video
    @event_form = EventForm.new
    @event_form.videos.build
    render partial: 'video', locals: { index: Time.now.to_i, f: @event_form }
  end

  def new_gift
    @event_form = EventForm.new
    @event_form.gifts.build
    render partial: 'gift', locals: { index: Time.now.to_i, f: @event_form }
  end

  def new_pre_ceremony
    @event_form = EventForm.new
    @event_form.pre_ceremonies.build
    render partial: 'pre_ceremony', locals: { index: Time.now.to_i, f: @event_form }
  end

  private

  def event_quote_params
    params.require(:event_form).permit(
      :detail, :cost, :adult_count, :input_date, :child_count,
      ceremonies_attributes: [:id, :ceremony_type, :ceremony_cost],
      foods_attributes: [:id, :food_type, :food_cost],
      costumes_attributes: [:id, :costume_type, :costume_cost],
      beauties_attributes: [:id, :beauty_type, :beauty_cost],
      flowers_attributes: [:id, :flower_type, :flower_cost],
      prints_attributes: [:id, :print_type, :print_cost],
      stagings_attributes: [:id, :staging_type, :staging_cost],
      photos_attributes: [:id, :photo_type, :photo_cost],
      videos_attributes: [:id, :video_type, :video_cost],
      gifts_attributes: [:id, :gift_type, :gift_cost],
      pre_ceremonies_attributes: [:id, :pre_ceremony_type, :pre_ceremony_cost]
    ).merge(event_id: params[:event_id])
  end

  def handle_record_not_found
    flash[:alert] = 'The event you were looking for could not be found.'
    redirect_to root_path
  end
end
