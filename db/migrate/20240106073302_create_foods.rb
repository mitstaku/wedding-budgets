class CreateFoods < ActiveRecord::Migration[7.0]
  def change
    create_table :foods do |t|
      t.references :event_quote, null: false, foreign_key: true
      t.integer :food_type
      t.decimal :food_cost
      t.timestamps
    end
  end
end
