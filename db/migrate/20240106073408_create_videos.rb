class CreateVideos < ActiveRecord::Migration[7.0]
  def change
    create_table :videos do |t|
      t.references :event_quote, null: false, foreign_key: true
      t.integer :video_type
      t.decimal :video_cost
      t.timestamps
    end
  end
end
