class CreateVenues < ActiveRecord::Migration[7.0]
  def change
    create_table :venues do |t|
      t.references :event_quote, null: false, foreign_key: true
      t.integer :venue_type
      t.decimal :venue_cost
      t.timestamps
    end
  end
end
