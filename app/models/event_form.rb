class EventForm
  include ActiveModel::Model


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
                :pre_ceremony_type, :pre_ceremony_cost


  validates :event_id, :version_number, :cost, :input_date,
            :adult_count, :child_count, presence: true
                        
  def save
    event_quote = EventQuote.create!(
      event_id: event_id,
      version_number: version_number,
      detail: detail,
      cost: cost,
      input_date: input_date
    )
    guest = Guest.create!(
      event_quote_id: event_quote.id,
      adult_count: adult_count,
      child_count: child_count
    )
    ceremony = Ceremony.create!(
      event_quote_id: event_quote.id,
      ceremony_type: ceremony_type,
      ceremony_cost: ceremony_cost
    )
    food = Food.create!(
      event_quote_id: event_quote.id,
      food_type: food_type,
      food_cost: food_cost
    )
    venue = Venue.create!(
      event_quote_id: event_quote.id,
      venue_type: venue_type,
      venue_cost: venue_cost
    )
    costume = Costume.create!(
      event_quote_id: event_quote.id,
      costume_type: costume_type,
      costume_cost: costume_cost
    )
    beauty = Beauty.create!(
      event_quote_id: event_quote.id,
      beauty_type: beauty_type,
      beauty_cost: beauty_cost
    )
    flower = Flower.create!(
      event_quote_id: event_quote.id,
      flower_type: flower_type,
      flower_cost: flower_cost
    )
    print = Print.create!(
      event_quote_id: event_quote.id,
      print_type: print_type,
      print_cost: print_cost
    )
    staging = Staging.create!(
      event_quote_id: event_quote.id,
      staging_type: staging_type,
      staging_cost: staging_cost
    )
    photo = Photo.create!(
      event_quote_id: event_quote.id,
      photo_type: photo_type,
      photo_cost: photo_cost
    )
    video = Video.create!(
      event_quote_id: event_quote.id,
      video_type: video_type,
      video_cost: video_cost
    )
    gift = Gift.create!(
      event_quote_id: event_quote.id,
      gift_type: gift_type,
      gift_cost: gift_cost
    )
    pre_ceremony = PreCeremony.create!(
      event_quote_id: event_quote.id,
      pre_ceremony_type: pre_ceremony_type,
      pre_ceremony_cost: pre_ceremony_cost
    )
  end

  def self.model_name
    ActiveModel::Name.new(self, nil, "EventForm")
  end
end



