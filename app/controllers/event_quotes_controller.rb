class EventQuotesController < ApplicationController
  # ユーザーがログインしていない場合、index以外のアクションは実行できないようにする
  before_action :authenticate_user!, except: [:index]

  # イベント見積もりの一覧を表示するアクション
  def index
    # ログインしているユーザーのイベントを取得
    @events = user_signed_in? ? current_user.events : []
    # ログインしているユーザーのイベント見積もりを取得
    @event_quotes = user_signed_in? ? EventQuote.where(event_id: current_user.events.pluck(:id)).group_by(&:event_id) : []
  end

  # 新しいイベント見積もりを作成するアクション
  def new
    # パラメータからイベントを取得
    @event = Event.find(params[:event_id])
    # 新しいイベントフォームを作成
    @event_form = EventForm.new
    # 各フィールドのインデックスを初期化

  end

  # イベント見積もりをデータベースに保存するアクション
  def create
    # パラメータからイベントを取得
    @event = Event.find(params[:event_id])
    # 新しいイベントフォームを作成し、パラメータを設定
    @event_form = EventForm.new(event_quote_params)
    # イベントIDを設定
    @event_form.event_id = @event.id

    # 現在の日付をinput_dateに設定
    @event_form.input_date = Date.today

    # costがnullの場合、デフォルト値を設定
    @event_form.cost ||= 0

    # 既存のイベントバージョンの数をカウントし、1を加えてversion_numberに設定
    @event_form.version_number = EventQuote.where(event_id: @event.id).count + 1

    # フォームが有効な場合、保存してイベントページにリダイレクト
    if @event_form.valid?
      @event_form.save
      redirect_to event_path(@event)
    else
      render :new
    end
  end

  # イベント見積もりを削除するアクション
  def destroy
    # パラメータからイベントとイベント見積もりを取得
    @event = Event.find(params[:event_id])
    @event_quote = @event.event_quotes.find(params[:id])
    # イベントのユーザーIDが現在のユーザーIDと一致する場合、イベント見積もりを削除
    if @event.user_id == current_user.id
      @event_quote.destroy
      redirect_to event_path(@event)
    else
      # 一致しない場合、イベントページにリダイレクト
      redirect_to event_path(@event)
    end
  end

  # 新しい食事を作成するアクション
  def new_food
    @event_form = EventForm.new
    @event_form.foods.build
    render partial: 'food', locals: { index: Time.now.to_i, f: @event_form }
  end

  # 新しい衣装を作成するアクション
  def new_costume
    @event_form = EventForm.new
    @event_form.costumes.build
    render partial: 'costume', locals: { index: Time.now.to_i, f: @event_form }
  end

  # 新しい会場を作成するアクション
  def new_venue
    @event_form = EventForm.new
    @event_form.venues.build
    render partial: 'venue', locals: { index: Time.now.to_i, f: @event_form }
  end

  # 新しい挙式を作成するアクション
  def new_ceremony
    @event_form = EventForm.new
    @event_form.ceremonies.build
    render partial: 'ceremony', locals: { index: Time.now.to_i, f: @event_form }
  end

  # 新しい美容を作成するアクション
  def new_beauty
    @event_form = EventForm.new
    @event_form.beauties.build
    render partial: 'beauty', locals: { index: Time.now.to_i, f: @event_form }
  end

  # 新しい花を作成するアクション
  def new_flower
    @event_form = EventForm.new
    @event_form.flowers.build
    render partial: 'flower', locals: { index: Time.now.to_i, f: @event_form }
  end

  # 新しい印刷物を作成するアクション
  def new_print
    @event_form = EventForm.new
    @event_form.prints.build
    render partial: 'print', locals: { index: Time.now.to_i, f: @event_form }
  end

  # 新しいステージングを作成するアクション
  def new_staging
    @event_form = EventForm.new
    @event_form.stagings.build
    render partial: 'staging', locals: { index: Time.now.to_i, f: @event_form }
  end

  # 新しい写真を作成するアクション
  def new_photo
    @event_form = EventForm.new
    @event_form.photos.build
    render partial: 'photo', locals: { index: Time.now.to_i, f: @event_form }
  end

  # 新しいビデオを作成するアクション
  def new_video
    @event_form = EventForm.new
    @event_form.videos.build
    render partial: 'video', locals: { index: Time.now.to_i, f: @event_form }
  end

  # 新しいギフトを作成するアクション
  def new_gift
    @event_form = EventForm.new
    @event_form.gifts.build
    render partial: 'gift', locals: { index: Time.now.to_i, f: @event_form }
  end

  # 新しい前挙式を作成するアクション
  def new_pre_ceremony
    @event_form = EventForm.new
    @event_form.pre_ceremonies.build
    render partial: 'pre_ceremony', locals: { index: Time.now.to_i, f: @event_form }
  end

  private

  # パラメータからイベントフォームのデータを取得するメソッド
  def event_quote_params
    params.require(:event_form).permit(
      :detail, :cost, :adult_count, :input_date, :child_count,
      ceremonies_attributes: [:id, :ceremony_type, :ceremony_cost],
      foods_attributes: [:id, :food_type, :food_cost],
      costumes_attributes: [:id, :costume_type, :costume_cost],
      beauties_attributes: [:id, :beauty_type, :beauty_cost],
      flowers_attributes: [:id, :flower_type, :flower_cost],
      venues_attributes: [:id, :venue_type, :venue_cost],
      prints_attributes: [:id, :print_type, :print_cost],
      stagings_attributes: [:id, :staging_type, :staging_cost],
      photos_attributes: [:id, :photo_type, :photo_cost],
      videos_attributes: [:id, :video_type, :video_cost],
      gifts_attributes: [:id, :gift_type, :gift_cost],
      pre_ceremonies_attributes: [:id, :pre_ceremony_type, :pre_ceremony_cost]
    ).merge(event_id: params[:event_id])
  end
end
