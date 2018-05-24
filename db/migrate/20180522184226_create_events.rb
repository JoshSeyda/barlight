class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :title
      t.datetime :start
      t.datetime :end
      t.string :color 
      t.boolean :light_on
      t.references :schedule
      t.references :venue 
      t.timestamps
    end
  end
end
