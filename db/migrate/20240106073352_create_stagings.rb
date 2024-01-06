class CreateStagings < ActiveRecord::Migration[7.0]
  def change
    create_table :stagings do |t|
      t.references :event_quote, null: false, foreign_key: true
      t.integer :staging_type
      t.decimal :staging_cost
      t.timestamps
    end
  end
end
