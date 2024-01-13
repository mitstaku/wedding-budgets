class EventForm
  include ActiveModel::Model

  # イベントフォームの属性を設定
  attr_accessor :event_id, :version_number, :detail, :cost, :input_date,
                :ceremony_type, :ceremony_cost,
                :adult_count, :child_count,
                :food_type, :food_cost,
                :venue_type, :venue_cost,
                :costume_type, :costume_cost,
                :beauty_type, :beauty_cost,
                :flower_type, :flower_cost,
                :print_type, :print_cost,
                :staging_type, :staging_detail, :staging_cost,
                :photo_type, :photo_cost,
                :video_type, :video_cost,
                :gift_type, :gift_cost,
                :pre_ceremony_type, :pre_ceremony_cost,
                :foods, :ceremonies, :venues, :costumes, :beauties, :flowers, :prints, :stagings, :photos, :videos, :gifts, :pre_ceremonies

  # バリデーションを設定
  validates :event_id, :version_number, :input_date,
            :adult_count, :child_count, presence: true
  validates :cost, numericality: { only_integer: true, greater_than_or_equal_to: 1 }
  validates :adult_count, :child_count, numericality: { only_integer: true }
  validates :ceremony_cost, :food_cost, :venue_cost, :costume_cost, :beauty_cost, :flower_cost, :print_cost, :staging_cost,
            :photo_cost, :video_cost, :gift_cost, :pre_ceremony_cost, numericality: { only_integer: true, allow_blank: true }

  # イベントフォームの初期化
  def initialize(attributes = {})
    super attributes

    # 各属性が存在しない場合、新しいインスタンスを作成
    self.foods = 10.times.map { Food.new } unless foods.present?
    self.ceremonies = 10.times.map { Ceremony.new } unless ceremonies.present?
    self.venues = 10.times.map { Venue.new } unless venues.present?
    self.costumes = 10.times.map { Costume.new } unless costumes.present?
    self.beauties = 10.times.map { Beauty.new } unless beauties.present?
    self.flowers = 10.times.map { Flower.new } unless flowers.present?
    self.prints = 10.times.map { Print.new } unless prints.present?
    self.stagings = 10.times.map { Staging.new } unless stagings.present?
    self.photos = 10.times.map { Photo.new } unless photos.present?
    self.videos = 10.times.map { Video.new } unless videos.present?
    self.gifts = 10.times.map { Gift.new } unless gifts.present?
    self.pre_ceremonies = 10.times.map { PreCeremony.new } unless pre_ceremonies.present?
  end

  # 各属性のセッターメソッドを定義
  def foods_attributes=(attributes)
    self.foods = attributes.map { |_, v| Food.new(v) }
  end

  def ceremonies_attributes=(attributes)
    self.ceremonies = attributes.map { |_, v| Ceremony.new(v) }
  end

  def venues_attributes=(attributes)
    self.venues = attributes.map { |_, v| Venue.new(v) }
  end

  def costumes_attributes=(attributes)
    self.costumes = attributes.map { |_, v| Costume.new(v) }
  end

  def beauties_attributes=(attributes)
    self.beauties = attributes.map { |_, v| Beauty.new(v) }
  end

  def flowers_attributes=(attributes)
    self.flowers = attributes.map { |_, v| Flower.new(v) }
  end

  def prints_attributes=(attributes)
    self.prints = attributes.map { |_, v| Print.new(v) }
  end

  def stagings_attributes=(attributes)
    self.stagings = attributes.map { |_, v| Staging.new(v) }
  end

  def photos_attributes=(attributes)
    self.photos = attributes.map { |_, v| Photo.new(v) }
  end

  def videos_attributes=(attributes)
    self.videos = attributes.map { |_, v| Video.new(v) }
  end

  def gifts_attributes=(attributes)
    self.gifts = attributes.map { |_, v| Gift.new(v) }
  end

  def pre_ceremonies_attributes=(attributes)
    self.pre_ceremonies = attributes.map { |_, v| PreCeremony.new(v) }
  end

  # イベントフォームの保存メソッド
  def save
    # トランザクションを開始
    Event.transaction do
      # イベント見積もりを作成
      event_quote = EventQuote.create!(
        event_id: event_id,
        version_number: version_number,
        detail: detail,
        cost: cost,
        input_date: input_date
      )
      # ゲストを作成
      guest = Guest.create!(
        event_quote_id: event_quote.id,
        adult_count: adult_count,
        child_count: child_count
      )
      # 各属性のインスタンスを作成
      ceremonies.each do |ceremony|
        Ceremony.create!(
          event_quote_id: event_quote.id,
          ceremony_type: ceremony.ceremony_type,
          ceremony_cost: ceremony.ceremony_cost
        )
      end
      foods.each do |food|
        Food.create!(
          event_quote_id: event_quote.id,
          food_type: food.food_type,
          food_cost: food.food_cost
        )
      end
      venues.each do |venue|
        Venue.create!(
          event_quote_id: event_quote.id,
          venue_type: venue.venue_type,
          venue_cost: venue.venue_cost
        )
      end
      costumes.each do |costume|
        Costume.create!(
          event_quote_id: event_quote.id,
          costume_type: costume.costume_type,
          costume_cost: costume.costume_cost
        )
      end
      beauties.each do |beauty|
        Beauty.create!(
          event_quote_id: event_quote.id,
          beauty_type: beauty.beauty_type,
          beauty_cost: beauty.beauty_cost
        )
      end
      flowers.each do |flower|
        Flower.create!(
          event_quote_id: event_quote.id,
          flower_type: flower.flower_type,
          flower_cost: flower.flower_cost
        )
      end
      prints.each do |print|
        Print.create!(
          event_quote_id: event_quote.id,
          print_type: print.print_type,
          print_cost: print.print_cost
        )
      end
      stagings.each do |staging|
        Staging.create!(
          event_quote_id: event_quote.id,
          staging_type: staging.staging_type,
          staging_cost: staging.staging_cost
        )
      end
      photos.each do |photo|
        Photo.create!(
          event_quote_id: event_quote.id,
          photo_type: photo.photo_type,
          photo_cost: photo.photo_cost
        )
      end
      videos.each do |video|
        Video.create!(
          event_quote_id: event_quote.id,
          video_type: video.video_type,
          video_cost: video.video_cost
        )
      end
      gifts.each do |gift|
        Gift.create!(
          event_quote_id: event_quote.id,
          gift_type: gift.gift_type,
          gift_cost: gift.gift_cost
        )
      end
      pre_ceremonies.each do |pre_ceremony|
        PreCeremony.create!(
          event_quote_id: event_quote.id,
          pre_ceremony_type: pre_ceremony.pre_ceremony_type,
          pre_ceremony_cost: pre_ceremony.pre_ceremony_cost
        )
      end
    end
    true
  rescue StandardError => e
    # 例外が発生した場合、falseを返す
    false
  end
end
