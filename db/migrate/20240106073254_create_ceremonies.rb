class CreateCeremonies < ActiveRecord::Migration[7.0]
  def change
    create_table :ceremonies do |t|
      t.references :event_quote, null: false, foreign_key: true
      t.integer :ceremony_type
      t.decimal :ceremony_cost
      t.timestamps
    end
  end
end

