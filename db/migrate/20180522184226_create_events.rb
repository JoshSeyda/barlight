class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :dow,  array: true, default: []
      t.string :title
      t.datetime :start
      t.datetime :end
      t.string :color  
      t.timestamps
  end
end
end
