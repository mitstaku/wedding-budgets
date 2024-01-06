class CreateFlowers < ActiveRecord::Migration[7.0]
  def change
    create_table :flowers do |t|
      t.references :event_quote, null: false, foreign_key: true
      t.integer :flower_type
      t.decimal :flower_cost
      t.timestamps
    end
  end
end
