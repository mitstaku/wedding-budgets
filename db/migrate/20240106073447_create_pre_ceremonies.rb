class CreatePreCeremonies < ActiveRecord::Migration[7.0]
  def change
    create_table :pre_ceremonies do |t|
      t.references :event_quote, null: false, foreign_key: true
      t.integer :pre_ceremony_type
      t.decimal :pre_ceremony_cost
      t.timestamps
    end
  end
end
