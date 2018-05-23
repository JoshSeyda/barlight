class CreateRegulars < ActiveRecord::Migration[5.2]
  def change
    create_table :regulars do |t|
      t.references :tender, index: true
      t.references :customer, index: true

      t.timestamps
    end
    add_foreign_key :regulars, :users, column: :tender_id, primary_key: :id
    add_foreign_key :regulars, :users, column: :customer_id, primary_key: :id
  end
end
