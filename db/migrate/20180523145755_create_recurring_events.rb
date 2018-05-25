class CreateRecurringEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :recurring_events do |t|
      t.string :title
      t.date :anchor
      t.integer :frequency
      t.string :color
      t.boolean :light_on
      t.references :schedule
      t.references :venue 
      
      t.timestamps
    end
  end
end
