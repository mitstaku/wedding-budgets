class CreatePrints < ActiveRecord::Migration[7.0]
  def change
    create_table :prints do |t|
      t.references :event_quote, null: false, foreign_key: true
      t.integer :print_type
      t.decimal :print_cost
      t.timestamps
    end
  end
end
