class CreateBeauties < ActiveRecord::Migration[7.0]
  def change
    create_table :beauties do |t|
      t.references :event_quote, null: false, foreign_key: true
      t.integer :beauty_type
      t.decimal :beauty_cost
      t.timestamps
    end
  end
end
