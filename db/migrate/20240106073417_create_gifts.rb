class CreateGifts < ActiveRecord::Migration[7.0]
  def change
    create_table :gifts do |t|
      t.references :event_quote, null: false, foreign_key: true
      t.integer :gift_type
      t.decimal :gift_cost
      t.timestamps
    end
  end
end
