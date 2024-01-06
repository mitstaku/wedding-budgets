class CreateCostumes < ActiveRecord::Migration[7.0]
  def change
    create_table :costumes do |t|
      t.references :event_quote, null: false, foreign_key: true
      t.integer :costume_type
      t.decimal :costume_cost
      t.timestamps
    end
  end
end
