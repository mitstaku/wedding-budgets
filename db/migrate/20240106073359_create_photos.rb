class CreatePhotos < ActiveRecord::Migration[7.0]
  def change
    create_table :photos do |t|
      t.references :event_quote, null: false, foreign_key: true
      t.integer :photo_type
      t.decimal :photo_cost
      t.timestamps
    end
  end
end
