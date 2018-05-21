class CreateSchedules < ActiveRecord::Migration[5.2]
  def change
    create_table :schedules do |t|
      t.integer :dow, array: true, default: []
      t.datetime :clock_in
      t.date :clock_out
      t.boolean :light_on
      t.references :venue, index: true, foreign_key: true
      t.references :tender, index: true, foreign_key: {to_table: :users}

      t.timestamps
    end
  end
end
