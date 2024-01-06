class CreateEvents < ActiveRecord::Migration[7.0]
  def change
    create_table :events do |t|
      t.references :user, null: false, foreign_key: true
      t.string     :name, null: false
      t.date       :event_date, null: false
      t.timestamps
    end
  end
end
