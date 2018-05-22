class CreateSchedules < ActiveRecord::Migration[5.2]
  def change
    create_table :schedules do |t|
      t.integer :dow, array: true, default: []
      t.time :clock_in
      t.time :clock_out
      t.date :start_date
      t.date :end_date
      t.boolean :light_on
      t.references :venue, index: true, foreign_key: true
      t.references :tender, index: true, foreign_key: {to_table: :users}

      t.timestamps
    end
  end
end
