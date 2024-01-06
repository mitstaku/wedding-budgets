class CreateEventQuotes < ActiveRecord::Migration[7.0]
  def change
    create_table :event_quotes do |t|
        t.references :event, null: false, foreign_key: true
        t.integer :version_number, null: false
        t.text :detail
        t.decimal :cost, null: false
        t.date :input_date, null: false
      t.timestamps
    end
  end
end
