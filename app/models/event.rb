class Event < ApplicationRecord
  belongs_to :user
  belongs_to :event_quote

  with_options presence: true do
    validates :name
    validates :event_date, format: { with: /\A\d{4}-\d{2}-\d{2}\z/ }
  end
end
