class CreateGuests < ActiveRecord::Migration[7.0]
  def change
    create_table :guests do |t|
      t.references :event_quote, null: false, foreign_key: true
      t.string :adult_count, null: false
      t.string :child_count, null: false
      t.timestamps
    end
  end
end